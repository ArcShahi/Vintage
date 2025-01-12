import os
import sys
from PIL import Image

def convert_images_to_greyscale(input_folder):
    output_folder = os.path.join(input_folder, "vintage")
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    # Extended image formats
    IMAGE_FORMATS = ('.png', '.jpg', '.jpeg', '.bmp', '.tiff', '.webp')

    for root, dirs, files in os.walk(input_folder):
        for filename in files:
            if filename.lower().endswith(IMAGE_FORMATS) and root != output_folder:
                file_path = os.path.join(root, filename)
                try:
                    with Image.open(file_path) as img:
                        # Keep original format and mode info
                        original_format = img.format
                        original_mode = img.mode
                        
                        # Convert to greyscale
                        greyscale_img = img.convert('L')
                        
                        # Maintain original extension
                        output_path = os.path.join(output_folder, filename)
                        
                        # Save with format-specific settings to maintain quality
                        if original_format == 'JPEG' or original_format == 'JPG':
                            greyscale_img.save(output_path, 'JPEG', quality=100)
                        elif original_format == 'PNG':
                            greyscale_img.save(output_path, 'PNG')
                        elif original_format == 'BMP':
                            greyscale_img.save(output_path, 'BMP')
                        elif original_format == 'TIFF':
                            greyscale_img.save(output_path, 'TIFF')
                        elif original_format == 'WEBP':
                            greyscale_img.save(output_path, 'WEBP', lossless=True, quality=100)
                        else:
                            # For any other format, preserve original
                            greyscale_img.save(output_path, original_format)
                        
                        print(f"Converted {filename} to greyscale successfully.")
                except Exception as e:
                    print(f"Error processing {filename}: {e}")

def main():
    if len(sys.argv) != 2:
        input_folder = os.getcwd()
        print(f"No folder path provided. Using current working directory: {input_folder}")
    else:
        input_folder = sys.argv[1]
    
    if not os.path.exists(input_folder):
        print(f"The folder {input_folder} does not exist.")
        sys.exit(1)
    
    convert_images_to_greyscale(input_folder)

if __name__ == "__main__":
    main()
