# Vintage
Simple script to convert bulk images to greyscale.

I had previously written it in python. Because for some  reason I had forgotten that awesome tools like : FFMPEG , ImageMagick exist... I really should stop eating so many chocolate doughnuts.

Anyways I didn't wanted to remove the Python version so here we are with 2 verstion of bulk image processors...

>[!Important]
> Select the version best fits your need
> [Python](#Python-x-Pillow) or
>
> [PowerShell](#powershell-x-imagemagic-)

 you can select anyone based on your usecase.

## Python x Pillow :


- If you don't care about greyscale type is bit off... Just need it greyscaled.
- Already have Python installed and wanna use it for some other project
- Don't care about pixel-pefect

See when to use [PowerShell version](PowerShell x ImageMagick :)

### Prerequisites
 1. Python installed ofcourse 
   ```bash
   winget install Python 
   ```
 2. Pillow Module
 ```bash
 pip install pillow
 ```

Supported format : `png , jpeg , jpg , bmp , tiff , webp . jfif`

### Usage >

```powershell
python vintage.py "path/to/folder" 
```
or Just click on the `vintage.py` in the input folder

The output will be `path/to/folder[V]` or modify the script to costumize output path.



Here's comparsion .. we'll you can't see the details here anyway but trust me I've tested it throughly.

### Comparison

Before :

<img src="https://github.com/user-attachments/assets/1cea29ca-4df1-4c18-b61e-a09d6befd6eb" width=500, height=700>

After:

<img src="https://github.com/user-attachments/assets/2c485158-9111-458b-a499-ff7a90dacd33" width=500, height=700>


## PowerShell x ImageMagick :

I created this version because I'm a avid artwork collector, I like to keep outstanding comic book panels , artworks. Most of them are in colors but after reading 1000s of Manga, I like to see them in greyscale version. Without losing any pixle.

Use this version :
- If you like to collect vivid artworks from Pixiv and others and wanna see them in greyscale . Because you understand some things look much better with 2 colors.
- If you like to collect 4K "homework" pics and wanna see them with a **Vintage** Feel. iykyk ;)
- If you care too much about subtle details and gradient like me.
- Don't have python installed and don't want to


### Prerequisites:

1. Install **ImageMagick** from [Here](https://imagemagick.org/script/download.php#gsc.tab=0)
2. Open PowerShell and unblock this file so Windows will allow it to run 
```powershell
Unblock-File -Path "path\to\vintage.ps1"
```


### Usage >
```powershell
vintage.ps1 "path\to\dir"
```

You'll get your output at `path\to\dir[v]` , or modify the path.


>[CAUTION]
> I don't know much about ImageMagick so I'll have to do a bit of experimenting before I get the version of greyscale I like best.
>
> But If you've any suggestion or error reports , please let me know.


### Comparision

Before :

<img src="https://github.com/user-attachments/assets/b596e028-d54a-4191-bb08-5cb7bda5f028" width=500, height=1000 >

After:


<img src="https://github.com/user-attachments/assets/dd4067fc-c6a1-4fc3-a036-1b2355190ee1" width=500, height=1000>


-Shahi

## AI USAGE DISCLOSURE 

THE SCRIPT AND THE README IS WRITTEN WITHOUT ANY HELP OF ANY LLM, CO-PILOT, AI AGENT OR WHATEVER.

The Powershell script is partially AI Generated. WHICH ? It's irrelevant. Each one of them generated almost identical code. The README commit messages are sometimes self suggested by Github copilot.



