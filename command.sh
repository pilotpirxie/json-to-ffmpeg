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
color=c=black@0.0:s=1920x1080:d=3[gap_bh92MCkB];
color=black@0.0:s=1920x1080:d=2[5KQT9Ckn_base];
[0:v]trim=10:12,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[dxhHPhzE_clip];
[5KQT9Ckn_base][dxhHPhzE_clip]overlay=0:0:format=auto,rotate=0[clip1];
color=black@0.0:s=1920x1080:d=1[TRkRV3l0_base];
[1:v]trim=5:6,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[M2niEdas_clip];
[TRkRV3l0_base][M2niEdas_clip]overlay=0:0:format=auto,rotate=0[clip2];
color=c=black@0.0:s=1920x1080:d=4[gap_V3fb9OTh];
color=black@0.0:s=1920x1080:d=5[jbkSGZhZ_base];
[2:v]trim=3:8,setpts=PTS-STARTPTS,scale=960:540,format=rgba,colorchannelmixer=aa=0.5[wPVnhKof_clip];
[jbkSGZhZ_base][wPVnhKof_clip]overlay=480:270:format=auto,rotate=45[clip3];
color=black@0.0:s=1920x1080:d=5[WsX7ivoI_base];
[0:v]trim=27:32,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[GRB7BEUj_clip];
[WsX7ivoI_base][GRB7BEUj_clip]overlay=0:0:format=auto,rotate=0[clip4];
color=black@0.0:s=1920x1080:d=5[sRlNXTxl_base];
[1:v]trim=0:5,setpts=PTS-STARTPTS,scale=400:300,format=rgba,colorchannelmixer=aa=1[KhhiTJOu_clip];
[sRlNXTxl_base][KhhiTJOu_clip]overlay=50:50:format=auto,rotate=0[clip5];
color=black@0.0:s=1920x1080:d=5[F9O9HqKl_base];
[3:v]trim=15:20,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[oSsdbk9W_clip];
[F9O9HqKl_base][oSsdbk9W_clip]overlay=0:0:format=auto,rotate=0[clip6];
color=black@0.0:s=1920x1080:d=5[2DQ9fsRP_base];
[3:v]trim=0:5,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[58IkRsEf_clip];
[2DQ9fsRP_base][58IkRsEf_clip]overlay=0:0:format=auto,rotate=0[clip7];
color=black@0.0:s=1920x1080:d=5[yBgukekT_base];
[3:v]trim=10:15,setpts=PTS-STARTPTS,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[2A550oxV_clip];
[yBgukekT_base][2A550oxV_clip]overlay=0:0:format=auto,rotate=0[clip8];
color=c=black@0.0:s=1920x1080:d=0.5[void_clip1];
[void_clip1][clip1]xfade=transition=smoothup:duration=0.43:offset=0[clip1_from_xfade];
color=c=black@0.0:s=1920x1080:d=0.5[void_clip1_from_xfade];
[clip1_from_xfade][void_clip1_from_xfade]xfade=transition=smoothdown:duration=0.43:offset=1.5[clip1_from_xfade_to_xfade];
color=c=black@0.0:s=1920x1080:d=0.5[void_clip2];
[void_clip2][clip2]xfade=transition=fade:duration=0.43:offset=0[clip2_from_xfade];
color=c=black@0.0:s=1920x1080:d=0.5[void_clip2_from_xfade];
[clip2_from_xfade][void_clip2_from_xfade]xfade=transition=circlecrop:duration=0.43:offset=0.5[clip2_from_xfade_to_xfade];
color=c=black@0.0:s=1920x1080:d=0.5[void_clip3];
[clip3][void_clip3]xfade=transition=squeezev:duration=0.43:offset=4.5[clip3_to_xfade];
[gap_bh92MCkB][clip1_from_xfade_to_xfade][clip2_from_xfade_to_xfade][gap_V3fb9OTh][clip3_to_xfade][clip4][clip5][clip6][clip7][clip8]concat=n=10:v=1:a=0[track_with_some_videos];
color=black@0.0:s=1920x1080:d=30[K5UjwXi4_base];
[6:v]loop=loop=900:size=900,setpts=PTS-STARTPTS,scale=300:150,format=rgba,colorchannelmixer=aa=1[1rX0pFfi_clip];
[K5UjwXi4_base][1rX0pFfi_clip]overlay=1610:10:format=auto,rotate=0[watermark_clip];
color=c=black@0.0:s=1920x1080:d=10[gap_tdi9OfDh];
color=c=black@0.0:s=1920x1080:d=0.5[void_watermark_clip];
[watermark_clip][void_watermark_clip]xfade=transition=squeezeh:duration=0.43:offset=29.5[watermark_clip_to_xfade];
[watermark_clip_to_xfade][gap_tdi9OfDh]concat=n=2:v=1:a=0[track_with_watermark];
[4:a]atrim=0:20,asetpts=PTS-STARTPTS,volume=1[audio_clip1];
[5:a]atrim=0:20,asetpts=PTS-STARTPTS,volume=1[audio_clip2];
[audio_clip1][audio_clip2]concat=n=2:v=0:a=1[track2];
[base][track_with_some_videos]overlay=0:0[JdqOmbWC_combined_track];
[JdqOmbWC_combined_track][track_with_watermark]overlay=0:0[video_output];
[track2]anull[audio_output];" \
-map '[video_output]' -map '[audio_output]' -c:v libx264 -c:a aac -b:a 320k -r 30 -s 1920x1080 -ss 0 -t 35 -crf 23 -preset veryfast -pix_fmt yuv420p output.mp4
