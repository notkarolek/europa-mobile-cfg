from PIL import Image
import os

def stretch_to_square_pil(input_path, output_path=None):
    """
    Stretch an image to 1:1 aspect ratio using PIL/Pillow
    """
    # Open image
    img = Image.open(input_path)
    
    # Get current size
    width, height = img.size
    
    # Set target size (you can specify or use max dimension)
    # Option A: Use a fixed size
    target_size = 1024  # or 1024, etc.
    new_size = (target_size, target_size)
    
    # Option B: Stretch to square of max dimension
    # max_dim = max(width, height)
    # new_size = (max_dim, max_dim)
    
    # Resize with stretching (Image.NEAREST for pixel art, Image.BILINEAR/LANCZOS for photos)
    stretched_img = img.resize(new_size, Image.Resampling.NEAREST)  # or Image.BILINEAR
    
    # Save or return
    if output_path:
        stretched_img.save(output_path)
        print(f"Saved stretched image to: {output_path}")
    else:
        # Auto-generate output filename
        name, ext = os.path.splitext(input_path)
        output_path = f"{name}_stretched{ext}"
        stretched_img.save(output_path)
        print(f"Saved to: {output_path}")
    
    return stretched_img

# Usage
stretch_to_square_pil("input.png", "output_square.png")