#!/bin/bash

. fubcam.config

mkdir -p $scriptPath/mp4/

find $scriptPath/data -size  0 -print0 |xargs -0 rm --
timespan=$(date +"%Y-%m-%d_%H")

ffmpeg -framerate 25 -f image2 \
       -pattern_type glob -i "$scriptPath/data/$timespan*.jpg" \
       -c:v libx264 -pix_fmt yuv420p \
       $scriptPath/mp4/$timespan.mp4
       