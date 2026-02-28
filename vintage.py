import os
import sys
import time
from PIL import Image


def greyscale(in_dir):
    
    print(f"\nScript Executing>>>\nConverting Dir : {os.path.abspath(in_dir)} to Greyscale...\n")
    
    # Will work with these , IDK if there are others
    IMG_FMTS = ('.png', '.jpg', '.jpeg', '.bmp', '.tiff', '.webp', '.jfif')
    
    
    temp_dir=in_dir.rstrip(os.sep)+"[VT]"
    os.makedirs(temp_dir,exist_ok=True)
        
    for root,dirs,files in os.walk(in_dir):
        
        if os.path.abspath(root).startswith(os.path.abspath(temp_dir)):
            continue
        
        # Mirroring so the dir structure is preserved. avoids overwriting of files...
        out_dir=os.path.join(temp_dir,os.path.relpath(root,in_dir))
        os.makedirs(out_dir,exist_ok=True)
        
        
        for file in files:
            
            if not file.lower().endswith(IMG_FMTS):
                continue
            
            in_path=os.path.join(root,file)
            out_path=os.path.join(out_dir,file)
            
            print(f"Converting: {file} ... ", end="")
            
            try:
                with Image.open(in_path) as img:
                    fmt = img.format or os.path.splitext(file)[1][1:].upper()
                    gray = img.convert("L")
                    save_kwargs={}
                    
                    if fmt in ("JPEG","JPG"):
                        save_kwargs=dict(quality=100,subsampling=0)
                    elif fmt=="WEBP":
                        save_kwargs=dict(lossless=True)
                    elif fmt=="PNG":
                        save_kwargs=dict(compress_level=0)
                        
                    
                    gray.save(out_path,fmt,**save_kwargs)
            
                print("✓")
            
            except Exception as e:
                print(f"{file} ✗ --Don't know why...JK: {e}")
                
            


def main():
    start=time.perf_counter()
    greyscale(sys.argv[1] if len(sys.argv)>=2 else os.getcwd())
    end=time.perf_counter()
    
    print(f"Time taken: {end - start:.4f} seconds\n\n")
    

if __name__=="__main__":
    main()
