param(
    [Parameter(Mandatory = $true)]
    [string]$Source
)

$Source = (Resolve-Path $Source).Path

# Mirroring input dir structure to avoid overwriting of files..
$parent = Split-Path $Source -Parent
$name = Split-Path $Source -Leaf
$Dest = Join-Path $parent "$name[V]"

New-Item -ItemType Directory -Path $Dest -Force | Out-Null

$lossy = @(".jpg", ".jpeg", ".webp", ".heic", ".avif")
$pattern = "\.(png|jpg|jpeg|bmp|tiff|tif|webp|heic|avif)$"

$images = Get-ChildItem $Source -Recurse -File |
Where-Object { $_.Extension.ToLower() -match $pattern }

Write-Host "Processing pics..." -ForegroundColor Cyan
Write-Host "Output dir: $Dest`n"  -ForegroundColor DarkCyan

# May cause some issues.. remove the cores var and experiment a bit. Kay :)
$cores = (Get-CimInstance Win32_Processor).NumberOfLogicalProcessors
$sync = [System.Collections.Hashtable]::Synchronized(@{})

$elapsed = Measure-Command {
    $images | ForEach-Object -Parallel {
        $img = $_
        $ext = $img.Extension.ToLower()
        $relative = $img.FullName.Substring($using:Source.Length)

        if ($using:lossy -contains $ext) {
            $relative = [System.IO.Path]::ChangeExtension($relative, ".png")
        }

       # Change it if you wanna change output dir
        $outPath = Join-Path $using:Dest $relative
        New-Item -ItemType Directory -Path (Split-Path $outPath) -Force | Out-Null

       # If you know ImageMagick CLI flags feel free to modify it as needed. LinearGray can also be used ( LOT DARKER )
        magick "$($img.FullName)" -colorspace Gray -depth 16 "$outPath"

        $sync = $using:sync
        [System.Threading.Monitor]::Enter($sync)
        try {
            if ($LASTEXITCODE -eq 0) {
                Write-Host "  $($img.Name) " -ForegroundColor DarkGray -NoNewline
                Write-Host "✓" -ForegroundColor Green
            }
            else {
                Write-Host "  ✗ $($img.FullName)" -ForegroundColor Red
            }
        }
        finally {
            [System.Threading.Monitor]::Exit($sync)
        }

    } -ThrottleLimit $cores
}
Write-Host "Done >_<" -ForegroundColor Cyan
Write-Host "Time: $($elapsed.Seconds)s $($elapsed.Milliseconds)ms" -ForegroundColor DarkCyan
