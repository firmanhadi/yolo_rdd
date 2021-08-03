from PIL import Image
from glob import glob

def level(img):
    copy = img.copy()
    for x in range(img.size[0]):
        for y in range(img.size[1]):
            pxl = list(copy.getpixel((x, y)))
            if pxl[0] < 220 and pxl[1] < 220: 
                pxl[0] = 0
                pxl[1] = 0
                pxl[2] = 0
            else:
                pxl[0] = 255
                pxl[1] = 255
                pxl[2] = 255
            copy.putpixel((x, y), tuple(pxl))
    return copy

for png_file in glob('./output/*_cropped.png'):
    image = Image.open(png_file)
    leveled = level(image)
    leveled.save(png_file.replace('_cropped.png', '_leveled.png'))
