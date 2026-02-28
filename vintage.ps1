param(
    [Parameter(Mandatory = $true)]
    [string]$Source
)

if (-not (Get-Command magick -ErrorAction SilentlyContinue)) {
    Write-Host "ImageMagick not found in PATH!" -ForegroundColor Red
    exit 1
}

$Source = (Resolve-Path $Source).Path.TrimEnd('\', '/')

# Mirroring input dir structure to avoid overwriting of files..
$parent = Split-Path $Source -Parent
$name   = Split-Path $Source -Leaf
$Dest   = Join-Path $parent "$name`[VT`]"   # backtick-escape brackets so PoSh won't glob them

New-Item -ItemType Directory -Path $Dest -Force | Out-Null

$lossy   = @(".jpg", ".jpeg", ".webp", ".heic", ".avif")
$pattern = "\.(png|jpg|jpeg|bmp|tiff|tif|webp|heic|avif)$"

$images = Get-ChildItem -LiteralPath $Source -Recurse -File |
          Where-Object { $_.Extension.ToLower() -match $pattern }

if ($images.Count -eq 0) {
    Write-Host "No images found in $Source" -ForegroundColor Yellow
    exit 0
}

Write-Host "Found $($images.Count) image(s)" -ForegroundColor Cyan
Write-Host "Processing pics..."              -ForegroundColor Cyan
Write-Host "Output dir: $Dest"              -ForegroundColor DarkCyan

$cores = (Get-CimInstance Win32_Processor).NumberOfLogicalProcessors
$sync  = [System.Collections.Hashtable]::Synchronized(@{})

$elapsed = Measure-Command {
    $images | ForEach-Object -Parallel {
        $img      = $_
        $ext      = $img.Extension.ToLower()
        $relative = $img.FullName.Substring($using:Source.Length).TrimStart('\', '/')

        if ($using:lossy -contains $ext) {
            $relative = [System.IO.Path]::ChangeExtension($relative, ".png")
        }

        $outPath = Join-Path $using:Dest $relative
        New-Item -ItemType Directory -Path (Split-Path $outPath) -Force | Out-Null

       & magick "$($img.FullName)" -colorspace Gray -depth 16 "$outPath"
       $exit = $LASTEXITCODE

        $sync = $using:sync
        [System.Threading.Monitor]::Enter($sync)
        try {
            if ($exit -eq 0) {
                Write-Host "  $($img.Name) " -ForegroundColor DarkGray -NoNewline
                Write-Host "✓"               -ForegroundColor Green
            } else {
                Write-Host "  ✗ $($img.FullName)" -ForegroundColor Red
            }
        } finally {
            [System.Threading.Monitor]::Exit($sync)
        }

    } -ThrottleLimit $cores
}

Write-Host "Done >_<"                                              -ForegroundColor Cyan
Write-Host "Time: $($elapsed.Seconds)s $($elapsed.Milliseconds)ms" -ForegroundColor DarkCyan
