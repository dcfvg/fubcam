
# remove black frames
mkdir temp
find data/ -name "*.jpg" -type 'f' -size -100k -exec mv {} temp \;

for m in {1..12} # month loop
do
   for d in {1..31} # days loops
   do
      month=`printf %02d $m`
      day=`printf %02d $d`

      filename="$(date +'%Y')-$month-$day"
      echo $filename
      ffmpeg -framerate 8 -f image2 -pattern_type glob -i "data/$filename*.jpg" -c:v libx264 -pix_fmt yuv420p $filename.mp4
  done
done

# restore black frames
find temp/ -name "*.jpg" -type 'f' -exec mv {} data \;
