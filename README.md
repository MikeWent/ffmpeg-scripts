# ffmpeg scripts

## convert.sh

Converts any video to H.264 MPEG-4 AAC

Example: `./convert.sh video.avi 1280 medium`

Output file will be saved as `video.mp4`

Default resolution is 1280(x720), default preset is `medium`. See full list` of presets [here](https://trac.ffmpeg.org/wiki/Encode/H.264#a2.Chooseapresetandtune)

## thumbnails.sh

Generates N thumbnails of video file.

Example: `./thumbnails.sh video.mp4 5`

Thumbnails will be saved as `video.mp4-[1-5].jpg`

Default amount is 5.
