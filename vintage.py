import os
import sys
from PIL import Image

def convert_images_to_greyscale(input_folder):
    # Create a new folder called 'vintage' inside the input folder
    output_folder = os.path.join(input_folder, "vintage")
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    # Walk through all directories and files in the input folder (including subdirectories)
    for root, dirs, files in os.walk(input_folder):
        for filename in files:
            file_path = os.path.join(root, filename)

            # Only process image files (you can add more formats if needed)
            if filename.lower().endswith(('.png', '.jpg', '.jpeg', '.bmp', '.gif')) and root != output_folder:
                try:
                    # Open the image
                    with Image.open(file_path) as img:
                        # Convert the image to greyscale
                        greyscale_img = img.convert("L")
                    
                        # Create corresponding output path in the 'vintage' folder
                        # Just use the filename without subdirectory structure
                        output_path = os.path.join(output_folder, filename)

                        # Save the greyscale image in the 'vintage' folder
                        greyscale_img.save(output_path)
                        print(f"Converted {file_path} to greyscale.")
                except Exception as e:
                    print(f"Failed to process {file_path}: {e}")

def main():
    # If no folder path argument is passed, use the current working directory
    if len(sys.argv) != 2:
        input_folder = os.getcwd()  # Default to current working directory
        print(f"No folder path provided. Using current working directory: {input_folder}")
    else:
        input_folder = sys.argv[1]

    # Check if the input folder exists
    if not os.path.exists(input_folder):
        print(f"The folder {input_folder} does not exist.")
        sys.exit(1)

    convert_images_to_greyscale(input_folder)

if __name__ == "__main__":
    main()
