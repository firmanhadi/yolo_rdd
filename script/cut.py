from PIL import Image
from glob import glob

for png_file in glob('./output/*.jpg'):
    image = Image.open(png_file)
    cropped = image.crop((200, 965, 1700, 1080))
    cropped.save(png_file.replace('.jpg', '_cropped.png'))

#    from PIL import Image
#from glob import glob
#import os
#for png_file in glob('./output/*.jpg'):
#    image = Image.open(png_file)
#    cropped = image.crop((458, 105, 1442, 161))
#    cropped.save(png_file.replace('.jpg', '_cropped.png'))
