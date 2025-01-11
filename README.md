# Vintage
Script to convert bulk images to greyscale

## Prerequisite
 1. Python installed
 2. Pillow Module if not `pip install Pillow`
    

The `.py` file should be present in the Directory or add it to your `Environment Path:` to call the script from anywhere (NOT RECOMMENDED )

## Usage : Call it in the folder
```powershell
python vintage.py "images/folder" 
```
or Just click on the `vintage.py` in the input folder

The output will be `images/folder/vintage` or modify the script to costumize output path.

>[!IMPORTANT]
>If you don't have Python installed , Follow the steps else click [Here](#Comparison) to see result of conversion.


1. Download the init.ps1 script
Download the `init.ps1` script to your local machine.
2. Set PowerShell Execution Policy
Open PowerShell and run the following command to allow the script to execute:
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser|
```

This will allow locally created scripts to run and prompt you to allow downloaded scripts from trusted sources.

3. Run the Script
Now, execute the init.ps1 script by running this command in PowerShell:
```powershell
.\init.ps1
```

This will download and install Python and the Pillow module automatically!



>[!Note]
>Report any issues or improvement

## Comparison

![red eyes](https://github.com/user-attachments/assets/f63af4fb-1778-4fe0-a1fd-d154ccd7627b)

After

![red eyes](https://github.com/user-attachments/assets/38421450-7aae-4e65-a781-728e04321d3b)
