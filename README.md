# Vintage
Simple script to convert single images or bulk images to greyscale. Without Quality Loss.

Supported format : `png , jpeg , jpg , bmp , tiff , webp . jfif`

## Prerequisite
 1. Python installed ofcourse
 2. Pillow Module

If you don't have those click [Here](#install-python--modules)


**The `.py` file should be present in the Directory or add it to your `Environment Path:` to call the script from anywhere (NOT RECOMMENDED )**

## Usage :

### Bulk convertingn all images in a directory
```powershell
python vintage.py "path/to/folder" 
```
or Just click on the `vintage.py` in the input folder

The output will be `path/to/folder[BW]` or modify the script to costumize output path.

### Single Images : 
```
python vintage.py "path/to/img"
```


## Comparison

Before :
<img src="https://github.com/user-attachments/assets/1cea29ca-4df1-4c18-b61e-a09d6befd6eb" width=500, height=700>

After:
<img src="https://github.com/user-attachments/assets/2c485158-9111-458b-a499-ff7a90dacd33" width=500, height=700>




## Install Python & Modules

>[!IMPORTANT]
>If you don't have Python installed , Follow the below steps


1. Download the `init.ps1` script from [Here](https://github.com/ArcShahi/Vintage/blob/main/init.ps1)

2. Set PowerShell Execution Policy

Open PowerShell and run the following command to allow the script to execute:
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

This will allow locally created scripts to run and prompt you to allow downloaded scripts from trusted sources.

3. Run the Script
Now, execute the init.ps1 script by running this command in PowerShell:
```powershell
.\init.ps1
```

This will download and install Python and the Pillow module automatically


-Shahi

## AI USAGE DISCLOSURE 

- THE SCRIPT AND THE README IS WRITTEN WITHOUT ANY HELP OF ANY LLM, CO-PILOT, AI AGENT OR WHATEVER.
- The Powershell script is partially AI Generated. WHICH ? It's irrelevant. Each one of them generated almost identical code. 
- The README commit messages are sometimes self suggested by Github copilot.



