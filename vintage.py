import os
import sys
from PIL import Image

IMG_FMTS=('.png','.jpg','.jpeg','.bmp',',.tiff','.webp','.jfif')


def greyscale(src_path,out_dir):
    
    filename=os.path.basename(src_path)
    dst_path=os.path.join(out_dir,filename)
    
    try:
        with Image.open(src_path) as img:
            bw_img=img.convert('L')
            bw_img.save(dst_path)
            print(f"Converted: {filename}")
    except Exception as e:
        print(f"Failed: {filename}. Don't know why... JK : {e}")
        

def process_dir(in_dir):
    
    out_dir=in_dir.rstrip(os.sep)+"[BW]"
    os.makedirs(out_dir,exist_ok=True)
    
    for root,dirs, files in os.walk(in_dir):
        if os.path.abspath(root)==os.path.abspath(out_dir):
            continue
        
        rel=os.path.relpath(root,in_dir)
        dest_root=os.path.join(out_dir,rel)
        os.makedirs(dest_root,exist_ok=True)
        
        for file in files:
            if file.lower().endswith(IMG_FMTS):
                greyscale(os.path.join(root,file),dest_root)


def process_img(file_path):
    
    if not file_path.lower().endswith(IMG_FMTS):
        print("Umm what is this img format ?!")
        return
    
    parent=os.path.dirname(file_path)
    out_dir=os.path.join(parent,"[BW]")
    os.makedirs(out_dir,exist_ok=True)
    
    greyscale(file_path,out_dir)
    

def main():
    
    path=""
    
    if len(sys.argv)<2:
        path=os.getcwd()
    else:
        path=sys.argv[1]


    if os.path.isfile(path):
        process_img(path)
    elif os.path.isdir(path):
        process_dir(path)
    else :
        print("USAGE:\n <vintage.py> <folder> || <img>")

if __name__=="__main__":
    main()
