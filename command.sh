#!/bin/bash
ffmpeg \
-i samples/bee1920.mp4 \
-i samples/book1920.mp4 \
-i samples/cows1920.mp4 \
-i samples/flowers1920.mp4 \
-i samples/ever.mp3 \
-i samples/weekend.mp3 \
-i samples/flower.png \
-filter_complex "color=c=black:s=1920x1080:d=90[base];
color=c=black@0.0:s=1920x1080:d=3[gapFRbMDKaE];
[0:v]trim=10:12,setpts=PTS-STARTPTS,scale=1920:1080,rotate=0,colorchannelmixer=aa=1[clip1];
[1:v]trim=5:6,setpts=PTS-STARTPTS,scale=1920:1080,rotate=0,colorchannelmixer=aa=1[clip2];
color=c=black@0.0:s=1920x1080:d=4[gap4IIUHK4R];
[2:v]trim=3:8,setpts=PTS-STARTPTS,scale=1920:1080,rotate=0,colorchannelmixer=aa=1[clip3];
[0:v]trim=27:32,setpts=PTS-STARTPTS,scale=1920:1080,rotate=0,colorchannelmixer=aa=1[clip4];
[1:v]trim=0:5,setpts=PTS-STARTPTS,scale=1920:1080,rotate=0,colorchannelmixer=aa=1[clip5];
[3:v]trim=15:20,setpts=PTS-STARTPTS,scale=1920:1080,rotate=0,colorchannelmixer=aa=1[clip6];
[3:v]trim=0:5,setpts=PTS-STARTPTS,scale=1920:1080,rotate=0,colorchannelmixer=aa=1[clip7];
[3:v]trim=10:15,setpts=PTS-STARTPTS,scale=1920:1080,rotate=0,colorchannelmixer=aa=1[clip8];
color=c=black@0.0:s=1920x1080:d=50[gapM5BOTahU];
[gapFRbMDKaE][clip1][clip2][gap4IIUHK4R][clip3][clip4][clip5][clip6][clip7][clip8][gapM5BOTahU]concat=n=11:v=1:a=0[track_with_some_videos];
[6:v]loop=loop=900:size=900,setpts=PTS-STARTPTS,scale=300:150,rotate=0,colorchannelmixer=aa=1[watermark_clip];
color=c=black@0.0:s=1920x1080:d=60[gaptPxj8WVx];
[watermark_clip][gaptPxj8WVx]concat=n=2:v=1:a=0[track_with_watermark];
[4:a]atrim=0:50,asetpts=PTS-STARTPTS,volume=1[audio_clip1];
[5:a]atrim=0:40,asetpts=PTS-STARTPTS,volume=1[audio_clip2];
[audio_clip1][audio_clip2]concat=n=2:v=0:a=1[track2];
[base][track_with_some_videos]overlay=0:0[combined_track_with_some_videos];
[combined_track_with_some_videos][track_with_watermark]overlay=0:0[video_output];
[track2]amix=inputs=1:duration=longest[audio_output];" \
-map '[video_output]' -map '[audio_output]' -c:v libx264 -c:a aac -b:v 1000k -r 30 -s 1920x1080 output.mp4
