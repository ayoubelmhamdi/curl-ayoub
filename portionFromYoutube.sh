#!/bin/bash
url=$(youtube-dl --youtube-skip-dash-manifest -g $1)
video_url=$(echo -e $url |sed -n '1 p')
audio_url=$(echo -e $url |sed -n '2 p')

ffmpeg                        \
    -y                        \
    -ss 60                    \
    -i  "$video_url"          \
    -ss 60                    \
    -i  "$audio_url"          \
    -map 0:v                  \
    -map 1:a                  \
    -ss 30        \
    -t 600          \
    -c:v libx264              \
    -c:a aac                  \
    vps-output.mp4



 # ffmpeg
 #    -ss 2:30
 #    -i "$video_url"
 #    -ss 2:30
 #    -i "$audio_url"
 #    -map 0:v
 #    -map 1:a
 #    -ss 30
 #    -t 1:10
 #    -c:v libx264
 #    -c:a aac gog-vs-triv.mkv
