#!/bin/bash

. fubcam.config

start=`date +%s`
date=$(date +"%Y-%m-%d_%H%M")
dateH=$(date +"%Y.%m.%d_%H:%M")
mkdir data

# get current

current=$scriptPath/data/$date.jpg

fswebcam -r 1920x1080 --no-banner -D 3 -S 100 $current
jpegoptim $current

# backup image online
# curl \
#   -F "pwd="$postpwd \
#   -F "fileToUpload=@"$current \
#   $posturl

# create live image

live="$scriptPath/live-$(hostname).jpg"

convert $current -resize 1280 \
  -background white label:$dateH \
  -bordercolor white -border 8x4 \
  -gravity Center -append $live
# -set colorspace Gray -separate -average \

jpegoptim $live

curl \
  -F "pwd="$postpwd \
  -F "fileToUpload=@"$live \
  -F "type=live" \
  $posturl

end=`date +%s`
echo Execution time was `expr $end - $start` seconds.
