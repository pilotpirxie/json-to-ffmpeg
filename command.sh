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
color=c=black@0.0:s=1920x1080:d=3[gap_87JfsuxM];
color=black@0.0:s=1920x1080:d=2[Dg2VCO1s_base];
[0:v]trim=10:12,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[opX74zf2_clip];
[Dg2VCO1s_base][opX74zf2_clip]overlay=0:0:format=auto,rotate=0[clip1];
color=black@0.0:s=1920x1080:d=1[qUs3PXOr_base];
[1:v]trim=5:6,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[cv16AaRV_clip];
[qUs3PXOr_base][cv16AaRV_clip]overlay=0:0:format=auto,rotate=0[clip2];
color=c=black@0.0:s=1920x1080:d=4[gap_Kx7G5uSQ];
color=black@0.0:s=1920x1080:d=5[xF1r8v2s_base];
[2:v]trim=3:8,setpts=PTS-STARTPTS,scale=960:540,format=rgba,colorchannelmixer=aa=0.5[JKI12uZp_clip];
[xF1r8v2s_base][JKI12uZp_clip]overlay=480:270:format=auto,rotate=45[clip3];
color=black@0.0:s=1920x1080:d=5[g5k5Tute_base];
[0:v]trim=27:32,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[SyuNu0Rb_clip];
[g5k5Tute_base][SyuNu0Rb_clip]overlay=0:0:format=auto,rotate=0[clip4];
color=black@0.0:s=1920x1080:d=5[hRbA1KQX_base];
[1:v]trim=0:5,setpts=PTS-STARTPTS,scale=400:300,format=rgba,colorchannelmixer=aa=1[TRlATtIf_clip];
[hRbA1KQX_base][TRlATtIf_clip]overlay=50:50:format=auto,rotate=0[clip5];
color=black@0.0:s=1920x1080:d=5[6EQIZ23k_base];
[3:v]trim=15:20,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[HVUC6Rhm_clip];
[6EQIZ23k_base][HVUC6Rhm_clip]overlay=0:0:format=auto,rotate=0[clip6];
color=black@0.0:s=1920x1080:d=5[QLOSW59h_base];
[3:v]trim=0:5,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[UCM5yIIp_clip];
[QLOSW59h_base][UCM5yIIp_clip]overlay=0:0:format=auto,rotate=0[clip7];
color=black@0.0:s=1920x1080:d=5[DTQQM0TW_base];
[3:v]trim=10:15,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[BRJ72BAV_clip];
[DTQQM0TW_base][BRJ72BAV_clip]overlay=0:0:format=auto,rotate=0[clip8];
color=c=black@0.0:s=1920x1080:d=0.5[void_clip1];
[void_clip1][clip1]xfade=transition=smoothup:duration=0.5:offset=0[clip1_from_xfade];
color=c=black@0.0:s=1920x1080:d=0.5[void_clip1_from_xfade];
[clip1_from_xfade][void_clip1_from_xfade]xfade=transition=smoothdown:duration=0.5:offset=1.5[clip1_from_xfade_to_xfade];
color=c=black@0.0:s=1920x1080:d=0.5[void_clip2];
[void_clip2][clip2]xfade=transition=fade:duration=0.5:offset=0[clip2_from_xfade];
color=c=black@0.0:s=1920x1080:d=0.5[void_clip2_from_xfade];
[clip2_from_xfade][void_clip2_from_xfade]xfade=transition=circlecrop:duration=0.5:offset=0.5[clip2_from_xfade_to_xfade];
color=c=black@0.0:s=1920x1080:d=0.5[void_clip3];
[clip3][void_clip3]xfade=transition=squeezev:duration=0.5:offset=4.5[clip3_to_xfade];
[gap_87JfsuxM][clip1_from_xfade_to_xfade][clip2_from_xfade_to_xfade][gap_Kx7G5uSQ][clip3_to_xfade][clip4][clip5][clip6][clip7][clip8]concat=n=10:v=1:a=0[track_with_some_videos];
color=black@0.0:s=1920x1080:d=30[AoJlB4Ti_base];
[6:v]loop=loop=900:size=900,setpts=PTS-STARTPTS,scale=300:150,format=rgba,colorchannelmixer=aa=1[xSp9CJ0Q_clip];
[AoJlB4Ti_base][xSp9CJ0Q_clip]overlay=1610:10:format=auto,rotate=0[watermark_clip];
color=c=black@0.0:s=1920x1080:d=10[gap_PzL5HMek];
[watermark_clip][gap_PzL5HMek]concat=n=2:v=1:a=0[track_with_watermark];
[4:a]atrim=0:20,asetpts=PTS-STARTPTS,volume=1[audio_clip1];
[5:a]atrim=0:20,asetpts=PTS-STARTPTS,volume=1[audio_clip2];
[audio_clip1][audio_clip2]concat=n=2:v=0:a=1[track2];
[base][track_with_some_videos]overlay=0:0[WaMwInkl_combined_track];
[WaMwInkl_combined_track][track_with_watermark]overlay=0:0[video_output];
[track2]anull[audio_output];" \
-map '[video_output]' -map '[audio_output]' -c:v libx264 -c:a aac -b:a 320k -r 30 -s 1920x1080 -ss 0 -t 35 -crf 23 -preset veryfast -pix_fmt yuv420p output.mp4
