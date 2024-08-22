#!/bin/bash

# Compile Typst files into images
find src -type f -name "*.typ" | while read -r file_path; do
    file=${file_path/\.typ/}
    typst compile -f svg $file.typ # convert typst into svg
    rsvg-convert --width 2000 --background-color white $file.svg > $file.svg.png # convert svg into png
    magick $file.svg.png -trim +repage -bordercolor white -border 5 $file.png # trim the png
    rm $file.svg && rm $file.svg.png
done

# Remove image metadata
exiftool -all:all= -r .
find . -type f -name "*_original" -delete