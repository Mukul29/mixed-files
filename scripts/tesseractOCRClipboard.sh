#! /bin/sh

FILE_PATH="/tmp/ocrImage.png"

maim -u -s $FILE_PATH
tesseract $FILE_PATH stdout --dpi 300 | xclip -selection clipboard

rm $FILE_PATH
