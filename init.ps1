# Function to check if a command exists
function Test-CommandExists {
    param ($command)
    try {
        if (Get-Command $command -ErrorAction Stop) {
            return $true
        }
    }
    catch {
        return $false
    }
}

# Check if winget is available
if (-not (Test-CommandExists "winget")) {
    Write-Host "Error: Winget is not installed. Please install Windows App Installer from the Microsoft Store." -ForegroundColor Red
    exit 1
}

# Check Python installation status
$pythonInstalled = $false
try {
    $pythonVersion = python --version 2>&1
    if ($pythonVersion -match "Python 3") {
        $pythonInstalled = $true
        Write-Host "`nPython Status:" -ForegroundColor Cyan
        Write-Host "✓ Python $pythonVersion is installed and ready to use." -ForegroundColor Green
    }
} catch {
    $pythonInstalled = $false
}

# Install Python if not present
if (-not $pythonInstalled) {
    Write-Host "`nPython is not installed. Installing Python via winget..." -ForegroundColor Yellow
    try {
        winget install --id Python.Python.3.12 -e --source winget
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
        Write-Host "✓ Python installation completed." -ForegroundColor Green
    } catch {
        Write-Host "❌ Error installing Python: $_" -ForegroundColor Red
        exit 1
    }
}

# Check Pillow installation
Write-Host "`nChecking Pillow installation..." -ForegroundColor Cyan
$pillowInstalled = python -c "import PIL" 2>$null
if ($?) {
    $pillowVersion = python -c "from PIL import __version__; print(__version__)" 2>$null
    Write-Host "✓ Pillow version $pillowVersion is already installed." -ForegroundColor Green
} else {
    Write-Host "Pillow is not installed. Installing now..." -ForegroundColor Yellow
    try {
        python -m pip install --upgrade pip
        python -m pip install --upgrade Pillow
        $pillowVersion = python -c "from PIL import __version__; print(__version__)" 2>$null
        Write-Host "✓ Pillow version $pillowVersion has been installed." -ForegroundColor Green
    } catch {
        Write-Host "❌ Error installing Pillow: $_" -ForegroundColor Red
        exit 1
    }
}

Write-Host "`nSystem Check Summary:" -ForegroundColor Cyan
Write-Host "✓ Python: $pythonVersion" -ForegroundColor Green
Write-Host "✓ Pillow: $pillowVersion" -ForegroundColor Green
Write-Host "`nYou can now run your image conversion script!" -ForegroundColor Green
