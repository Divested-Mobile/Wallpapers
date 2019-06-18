#!/bin/bash
#DivestOS: A privacy oriented Android distribution
#Copyright (c) 2017 Divested Computing Group
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <https://www.gnu.org/licenses/>.

echo "Formatting wallpapers..."

#Create new directories
rm -rf Compressed Thumbs
mkdir Compressed Thumbs

#Copy the original files
cp -r RAW/. Compressed/
cp -r RAW/. Thumbs/

#Resize the files
#mogrify -resize 2560x1440 Compressed/*.jpg #Fix this res
mogrify -resize 213x178 Thumbs/*.jpg

#Optimize the files
jpegoptim -s -m90 --size=1500 Compressed/*.jpg
jpegoptim -s -m80 Thumbs/*.jpg

#Rename the files
rename ".jpg" "_small.jpg" Thumbs/*.jpg
rename "-" "_" Compressed/*.jpg Thumbs/*.jpg
rename "-" "_" Compressed/*.jpg Thumbs/*.jpg
rename "-" "_" Compressed/*.jpg Thumbs/*.jpg

#TODO: Automatically create CREDITS and wallpapers.xml

echo "Formatting complete!"
