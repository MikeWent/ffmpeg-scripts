#!/bin/bash
input_file=$1
if [ -z "$2" ]; then
    resolution="1280" # default
else
    resolution=$2
fi
if [ -z "$3" ]; then
    preset="medium" # default
else
    preset=$3
fi
# replace extension and remove path
output_file=${input_file%.*}".mp4"
echo "Input file:         $input_file"
echo "Output resolution:  $resolution"
echo "Preset:             $preset"
echo "Output file:        $output_file"
sleep 1
ffmpeg -i $input_file \
       -c:v libx264 \
       -preset $preset \
       -vf scale=$resolution:-1 \
       -tune film \
       -crf 23 \
       -c:a aac \
       -movflags +faststart \
       -v error $output_file &

# start monitor
ffmpeg_pid=$!
sleep 1
progress --monitor --pid $ffmpeg_pid

# genrate 5 thumbnails
bash ./thumbnails.sh $output_file 5
