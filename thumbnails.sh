#!/bin/bash
input_file=$1
if [ -z "$2" ]; then
    thumbnails_to_create=5
else
    thumbnails_to_create=$2
fi

echo "Creating            $thumbnails_to_create thumbnails..."

# check video duration
video_duration=$(ffprobe -i $input_file -show_format -v quiet | sed -n 's/duration=//p')
# convert float to int
video_duration=${video_duration%.*} 
# calculate thumbnail frequency to fit amount
delimeter=$(($video_duration / $thumbnails_to_create))

# start ffmpeg
ffmpeg -i $input_file \
       -v error \
       -ss 3 \
       -vf "select=gt(scene\,0.4)" \
       -frames:v $thumbnails_to_create \
       -vsync vfr \
       -vf fps=1/$delimeter $input_file-%02d.jpg

thumbnails_amount=$(ls $input_file-*.jpg -1 | wc -l)
echo "Done!               $thumbnails_amount thumbnails created"
