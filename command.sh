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
color=c=black@0.0:s=1920x1080:d=3[gap_DY1LQKKe];
color=black@0.0:s=1920x1080:d=2[KF70CEDJ_base];
[0:v]trim=10:12,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[SrVqJNVx_clip];
[KF70CEDJ_base][SrVqJNVx_clip]overlay=0:0:format=auto,rotate=0[clip1];
color=black@0.0:s=1920x1080:d=1[YtF9yMok_base];
[1:v]trim=5:6,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[lebzkWHQ_clip];
[YtF9yMok_base][lebzkWHQ_clip]overlay=0:0:format=auto,rotate=0[clip2];
color=c=black@0.0:s=1920x1080:d=4[gap_m5cS3Eyo];
color=black@0.0:s=1920x1080:d=5[lcU0mp4v_base];
[2:v]trim=3:8,setpts=PTS-STARTPTS,scale=960:540,format=rgba,colorchannelmixer=aa=0.5[WkrKFWPv_clip];
[lcU0mp4v_base][WkrKFWPv_clip]overlay=480:270:format=auto,rotate=45[clip3];
color=black@0.0:s=1920x1080:d=5[Oh9PMLE8_base];
[0:v]trim=27:32,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[tL3jjcyI_clip];
[Oh9PMLE8_base][tL3jjcyI_clip]overlay=0:0:format=auto,rotate=0[clip4];
color=black@0.0:s=1920x1080:d=5[bXiE4EQw_base];
[1:v]trim=0:5,setpts=PTS-STARTPTS,scale=400:300,format=rgba,colorchannelmixer=aa=1[QJMRMq2U_clip];
[bXiE4EQw_base][QJMRMq2U_clip]overlay=50:50:format=auto,rotate=0[clip5];
color=black@0.0:s=1920x1080:d=5[OsaImtd3_base];
[3:v]trim=15:20,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[gW20vTUf_clip];
[OsaImtd3_base][gW20vTUf_clip]overlay=0:0:format=auto,rotate=0[clip6];
color=black@0.0:s=1920x1080:d=5[aEsIP8Ig_base];
[3:v]trim=0:5,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[7Ttcbd2R_clip];
[aEsIP8Ig_base][7Ttcbd2R_clip]overlay=0:0:format=auto,rotate=0[clip7];
color=black@0.0:s=1920x1080:d=5[pUrgWU9k_base];
[3:v]trim=10:15,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[8xTueufV_clip];
[pUrgWU9k_base][8xTueufV_clip]overlay=0:0:format=auto,rotate=0[clip8];
[gap_DY1LQKKe][clip1][clip2][gap_m5cS3Eyo][clip3][clip4][clip5][clip6][clip7][clip8]concat=n=10:v=1:a=0[track_with_some_videos];
color=black@0.0:s=1920x1080:d=30[u07p7zwx_base];
[6:v]loop=loop=900:size=900,setpts=PTS-STARTPTS,scale=300:150,rotate=0,format=rgba,colorchannelmixer=aa=1[oe4ZbcXD_clip];
[u07p7zwx_base][oe4ZbcXD_clip]overlay=1610:10:format=auto[watermark_clip];
color=c=black@0.0:s=1920x1080:d=10[gap_wokfyQWt];
[watermark_clip][gap_wokfyQWt]concat=n=2:v=1:a=0[track_with_watermark];
[4:a]atrim=0:20,asetpts=PTS-STARTPTS,volume=1[audio_clip1];
[5:a]atrim=0:20,asetpts=PTS-STARTPTS,volume=1[audio_clip2];
[audio_clip1][audio_clip2]concat=n=2:v=0:a=1[track2];
[base][track_with_some_videos]overlay=0:0[CX5Szyio_combined_track];
[CX5Szyio_combined_track][track_with_watermark]overlay=0:0[video_output];
[track2]amix=inputs=1:duration=longest[audio_output];" \
-map '[video_output]' -map '[audio_output]' -c:v libx264 -c:a aac -b:a 320k -r 30 -s 1920x1080 -t 40 -crf 23 -preset veryfast -pix_fmt yuv420p output.mp4
