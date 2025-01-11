# Check if Python is installed using winget
$pythonInstalled = winget list python -e | Select-String "Python"

if (-not $pythonInstalled) {
    Write-Host "Python is not installed. Installing Python via winget..."

    # Install Python using winget
    winget install --id Python.Python.3.10 -e --source winget

    Write-Host "Python installation completed."
} else {
    Write-Host "Python is already installed."
}

# Install Pillow using pip
Write-Host "Installing Pillow library..."
pip install Pillow

Write-Host "Pillow installation completed."
