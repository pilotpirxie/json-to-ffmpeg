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
color=c=black@0.0:s=1920x1080:d=3[gap_pgM8CV7o];
color=black@0.0:s=1920x1080:d=2[7wyiUP0L_base];
[0:v]trim=10:12,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[6kvqGPUy_clip];
[7wyiUP0L_base][6kvqGPUy_clip]overlay=0:0:format=auto,rotate=0[clip1];
color=black@0.0:s=1920x1080:d=1[DpVb221n_base];
[1:v]trim=5:6,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[jtuiO3dM_clip];
[DpVb221n_base][jtuiO3dM_clip]overlay=0:0:format=auto,rotate=0[clip2];
color=c=black@0.0:s=1920x1080:d=4[gap_QCoW4rKx];
color=black@0.0:s=1920x1080:d=5[0bpkLV33_base];
[2:v]trim=3:8,setpts=PTS-STARTPTS,scale=960:540,format=rgba,colorchannelmixer=aa=0.5[HW9kWtxl_clip];
[0bpkLV33_base][HW9kWtxl_clip]overlay=480:270:format=auto,rotate=45[clip3];
color=black@0.0:s=1920x1080:d=5[3QCcBqnV_base];
[0:v]trim=27:32,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[Y8a7wWIs_clip];
[3QCcBqnV_base][Y8a7wWIs_clip]overlay=0:0:format=auto,rotate=0[clip4];
color=black@0.0:s=1920x1080:d=5[AkAeClMI_base];
[1:v]trim=0:5,setpts=PTS-STARTPTS,scale=400:300,format=rgba,colorchannelmixer=aa=1[xcGft5aN_clip];
[AkAeClMI_base][xcGft5aN_clip]overlay=50:50:format=auto,rotate=0[clip5];
color=black@0.0:s=1920x1080:d=5[EELwcdVZ_base];
[3:v]trim=15:20,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[tuciXTlQ_clip];
[EELwcdVZ_base][tuciXTlQ_clip]overlay=0:0:format=auto,rotate=0[clip6];
color=black@0.0:s=1920x1080:d=5[a3Ho0p6q_base];
[3:v]trim=0:5,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[3FEezMmi_clip];
[a3Ho0p6q_base][3FEezMmi_clip]overlay=0:0:format=auto,rotate=0[clip7];
color=black@0.0:s=1920x1080:d=5[j8Mqedli_base];
[3:v]trim=10:15,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[H2DNbsSg_clip];
[j8Mqedli_base][H2DNbsSg_clip]overlay=0:0:format=auto,rotate=0[clip8];
[gap_pgM8CV7o][clip1][clip2][gap_QCoW4rKx][clip3][clip4][clip5][clip6][clip7][clip8]concat=n=10:v=1:a=0[track_with_some_videos];
color=black@0.0:s=1920x1080:d=30[iA7GrBn2_base];
[6:v]loop=loop=900:size=900,setpts=PTS-STARTPTS,scale=300:150,rotate=0,format=rgba,colorchannelmixer=aa=1[uiRQyfQE_clip];
[iA7GrBn2_base][uiRQyfQE_clip]overlay=1610:10:format=auto[watermark_clip];
color=c=black@0.0:s=1920x1080:d=10[gap_WvCMFDou];
[watermark_clip][gap_WvCMFDou]concat=n=2:v=1:a=0[track_with_watermark];
[4:a]atrim=0:20,asetpts=PTS-STARTPTS,volume=1[audio_clip1];
[5:a]atrim=0:20,asetpts=PTS-STARTPTS,volume=1[audio_clip2];
[audio_clip1][audio_clip2]concat=n=2:v=0:a=1[track2];
[base][track_with_some_videos]overlay=0:0[4z8JXcv4_combined_track];
[4z8JXcv4_combined_track][track_with_watermark]overlay=0:0[video_output];
[track2]amix=inputs=1:duration=longest[audio_output];" \
-map '[video_output]' -map '[audio_output]' -c:v libx264 -c:a aac -b:a 320k -r 30 -s 1920x1080 -ss 0 -t 35 -crf 23 -preset veryfast -pix_fmt yuv420p output.mp4
