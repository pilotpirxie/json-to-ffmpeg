#!/bin/bash
ffmpeg -y \
-i samples/bee1920.mp4 \
-i samples/book1920.mp4 \
-i samples/cows1920.mp4 \
-i samples/flowers1920.mp4 \
-i samples/ever.mp3 \
-i samples/weekend.mp3 \
-i samples/flower.png \
-filter_complex "color=c=black:s=1920x1080:d=40[base];
color=c=black@0.0:s=1920x1080:d=3[gap_7w7JE5qO];
color=black@0.0:s=1920x1080:d=2[BXAExDxp_base];
[0:v]trim=10:12,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[f5zBprDP_clip];
[BXAExDxp_base][f5zBprDP_clip]overlay=0:0:format=auto,rotate=0[clip1];
color=black@0.0:s=1920x1080:d=1[UIzywMtr_base];
[1:v]trim=5:6,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[2VrvVypI_clip];
[UIzywMtr_base][2VrvVypI_clip]overlay=0:0:format=auto,rotate=0[clip2];
color=c=black@0.0:s=1920x1080:d=4[gap_hhWZigNg];
color=black@0.0:s=1920x1080:d=5[1T5dbDxx_base];
[2:v]trim=3:8,setpts=PTS-STARTPTS,scale=960:540,format=rgba,colorchannelmixer=aa=0.5[FdiNGF0J_clip];
[1T5dbDxx_base][FdiNGF0J_clip]overlay=480:270:format=auto,rotate=45[clip3];
color=black@0.0:s=1920x1080:d=5[E736nQEu_base];
[0:v]trim=27:32,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[xicX1WcB_clip];
[E736nQEu_base][xicX1WcB_clip]overlay=0:0:format=auto,rotate=0[clip4];
color=black@0.0:s=1920x1080:d=5[I7meziFt_base];
[1:v]trim=0:5,setpts=PTS-STARTPTS,scale=400:300,format=rgba,colorchannelmixer=aa=1[MrLT2DOI_clip];
[I7meziFt_base][MrLT2DOI_clip]overlay=50:50:format=auto,rotate=0[clip5];
color=black@0.0:s=1920x1080:d=5[PmB10W5x_base];
[3:v]trim=15:20,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[K9igGuT9_clip];
[PmB10W5x_base][K9igGuT9_clip]overlay=0:0:format=auto,rotate=0[clip6];
color=black@0.0:s=1920x1080:d=5[K8dzzBa6_base];
[3:v]trim=0:5,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[kymbFnut_clip];
[K8dzzBa6_base][kymbFnut_clip]overlay=0:0:format=auto,rotate=0[clip7];
color=black@0.0:s=1920x1080:d=5[j2CP65RQ_base];
[3:v]trim=10:15,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[3xlGO7cG_clip];
[j2CP65RQ_base][3xlGO7cG_clip]overlay=0:0:format=auto,rotate=0[clip8];
[gap_7w7JE5qO][clip1][clip2][gap_hhWZigNg][clip3][clip4][clip5][clip6][clip7][clip8]concat=n=10:v=1:a=0[track_with_some_videos];
color=black@0.0:s=1920x1080:d=30[WQKjoSCv_base];
[6:v]loop=loop=900:size=900,setpts=PTS-STARTPTS,scale=300:150,format=rgba,colorchannelmixer=aa=1[8GYtuiYk_clip];
[WQKjoSCv_base][8GYtuiYk_clip]overlay=1610:10:format=auto,rotate=0[watermark_clip];
color=c=black@0.0:s=1920x1080:d=10[gap_GuNzYSEK];
[watermark_clip][gap_GuNzYSEK]concat=n=2:v=1:a=0[track_with_watermark];
[4:a]atrim=0:20,asetpts=PTS-STARTPTS,volume=1[audio_clip1];
[5:a]atrim=0:20,asetpts=PTS-STARTPTS,volume=1[audio_clip2];
[audio_clip1][audio_clip2]concat=n=2:v=0:a=1[track2];
[base][track_with_some_videos]overlay=0:0[d1WHlyBS_combined_track];
[d1WHlyBS_combined_track][track_with_watermark]overlay=0:0[video_output];
[track2]amix=inputs=1:duration=longest[audio_output];" \
-map '[video_output]' -map '[audio_output]' -c:v libx264 -c:a aac -b:a 320k -r 30 -s 1920x1080 -ss 0 -t 35 -crf 23 -preset veryfast -pix_fmt yuv420p output.mp4
