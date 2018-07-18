#!/bin/bash

. fubcam.config

file="live.jpg"

cd $scriptPath
ftp -n -i $host <<EOF
user $user $passwd
binary
mput $file
quit
EOF

# End of script

# cd $live
# echo open $host >> ftp.txt
# echo ascii >> ftp.txt
# echo user $user $passw>d >> ftp.txt
# echo cd / >> ftp.txt

# for file in $scriptPath/data/*jpg; do
#   echo "put $scriptPath/data/${file##*/}" >> ftp.txt
# done

# echo "put live.jpg" >> ftp.txt
# echo bye >> ftp.txt
# ftp -in < ftp.txt
# rm ftp.txt
