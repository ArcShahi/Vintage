# Vintage
Simple script to convert bulk images to greyscale.

I had previously written it in python. Because for some  reason I had forgotten that awesome tools like : FFMPEG , ImageMagick exist... I really should stop eating so many chocolate doughnuts.

Anyways but I didn't wanted to remove the Python version so here we are with 2 verstion of bulk image processors...


We've 2 version you can select anyone based on your usecase.

## Python version
- If you don't care about greyscale type is bit off... Just need it greyscaled.
- Already have Python installed and wanna use it for some other project
- Don't care about pixel-pefect

### Prerequisite
 1. Python installed ofcourse 
   ```bash
   winget install Python 
   ```
 2. Pillow Module ```bash
 pip install pillow
 ```

Supported format : `png , jpeg , jpg , bmp , tiff , webp . jfif`

If you don't have those click [Here](#install-python--modules)


**The `.py` file should be present in the Directory or add it to your `Environment Path:` to call the script from anywhere (NOT RECOMMENDED )**

### Usage :

### Bulk convertingn all images in a directory
```powershell
python vintage.py "path/to/folder" 
```
or Just click on the `vintage.py` in the input folder

The output will be `path/to/folder[BW]` or modify the script to costumize output path.

### Single Images : 
```powershell
python vintage.py "path/to/img"
```


### Comparison

Before :

<img src="https://github.com/user-attachments/assets/1cea29ca-4df1-4c18-b61e-a09d6befd6eb" width=500, height=700>

After:

<img src="https://github.com/user-attachments/assets/2c485158-9111-458b-a499-ff7a90dacd33" width=500, height=700>






-Shahi

## AI USAGE DISCLOSURE 

THE SCRIPT AND THE README IS WRITTEN WITHOUT ANY HELP OF ANY LLM, CO-PILOT, AI AGENT OR WHATEVER.

The Powershell script is partially AI Generated. WHICH ? It's irrelevant. Each one of them generated almost identical code. The README commit messages are sometimes self suggested by Github copilot.



