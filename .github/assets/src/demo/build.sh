#!/bin/bash
set -e
F=15; S="scale=1184:-2"
seg(){ ffmpeg -v error -y -ss $2 -t $3 -i demo.mp4 -i p/bg.png -i p/$5.png -filter_complex "[0:v]setpts=PTS/$4,fps=${F},${S}[t];[1:v][t]overlay=48:104[a];[a][2:v]overlay=0:0,format=yuv420p" -an seg_$1.mp4; }
hold(){ ffmpeg -v error -y -ss $2 -i demo.mp4 -frames:v 1 hf_$1.png
 ffmpeg -v error -y -loop 1 -t $3 -i p/bg.png -loop 1 -t $3 -i hf_$1.png -loop 1 -t $3 -i p/$4.png -filter_complex "[1:v]${S}[t];[0:v][t]overlay=48:104[a];[a][2:v]overlay=0:0,fps=${F},format=yuv420p" -an seg_$1.mp4; }
ffmpeg -v error -y -loop 1 -t 1.8 -i p/intro.png -vf "fps=${F},format=yuv420p" seg_0.mp4
seg 1 0.3 4.4 1 b1
seg 2 4.7 16.1 6 b6
hold 3 20.8 3.6 bp
seg 4 20.8 5.9 1.5 b15
hold 5 27.0 5 bp
ffmpeg -v error -y -f concat -safe 0 -i outro_list.txt -vf "fps=${F},format=yuv420p" seg_6.mp4
printf "file 'seg_%s.mp4'\n" 0 1 2 3 4 5 6 > list.txt
ffmpeg -v error -y -f concat -safe 0 -i list.txt -c copy film.mp4
ffprobe -v error -show_entries format=duration -of csv=p=0 film.mp4
