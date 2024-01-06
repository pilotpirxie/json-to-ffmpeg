#!/bin/bash
ffmpeg -y \
-i samples/bee1920.mp4 \
-i samples/book1920.mp4 \
-i samples/cows1920.mp4 \
-i samples/flowers1920.mp4 \
-i samples/ever.mp3 \
-i samples/weekend.mp3 \
-i samples/flower.png \
-filter_complex "color=c=black:s=384x216:d=40[base];
color=c=black@0.0:s=384x216:d=3[gap_Flov5cN6];
color=black@0.0:s=384x216:d=2[ScsL7jIt_base];
[0:v]trim=10:12,setpts=PTS-STARTPTS,fps=30,scale=384:216,format=rgba,colorchannelmixer=aa=1[fpo0LLRI_clip];
[ScsL7jIt_base][fpo0LLRI_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip1];
color=black@0.0:s=384x216:d=1[U7I4RDTI_base];
[1:v]trim=5:6,setpts=PTS-STARTPTS,fps=30,scale=384:216,format=rgba,colorchannelmixer=aa=1[3V1AHYLI_clip];
[U7I4RDTI_base][3V1AHYLI_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip2];
color=c=black@0.0:s=384x216:d=4[gap_G05u9yq0];
color=black@0.0:s=384x216:d=5[UPEKXcSS_base];
[2:v]trim=3:8,setpts=PTS-STARTPTS,fps=30,scale=192:108,format=rgba,colorchannelmixer=aa=0.5[2IGKuRRI_clip];
[UPEKXcSS_base][2IGKuRRI_clip]overlay=96:54:format=auto,rotate=45,fps=30[clip3];
color=black@0.0:s=384x216:d=5[MzTUMSQt_base];
[0:v]trim=27:32,setpts=PTS-STARTPTS,fps=30,scale=384:216,format=rgba,colorchannelmixer=aa=1[QlDoy1E4_clip];
[MzTUMSQt_base][QlDoy1E4_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip4];
color=black@0.0:s=384x216:d=5[sq4O29pF_base];
[1:v]trim=0:5,setpts=PTS-STARTPTS,fps=30,scale=80:60,format=rgba,colorchannelmixer=aa=1[0tu2RGal_clip];
[sq4O29pF_base][0tu2RGal_clip]overlay=10:10:format=auto,rotate=0,fps=30[clip5];
color=black@0.0:s=384x216:d=5[IGxQMOAo_base];
[3:v]trim=15:20,setpts=PTS-STARTPTS,fps=30,scale=384:216,format=rgba,colorchannelmixer=aa=1[jL3Uv6UV_clip];
[IGxQMOAo_base][jL3Uv6UV_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip6];
color=black@0.0:s=384x216:d=5[PrUP6kTL_base];
[2:v]trim=0:5,setpts=PTS-STARTPTS,fps=30,scale=384:216,format=rgba,colorchannelmixer=aa=1[6zFIJWHb_clip];
[PrUP6kTL_base][6zFIJWHb_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip7];
color=black@0.0:s=384x216:d=5[cEuQK0DM_base];
[0:v]trim=0:5,setpts=PTS-STARTPTS,fps=30,scale=384:216,format=rgba,colorchannelmixer=aa=1[sOokLMn0_clip];
[cEuQK0DM_base][sOokLMn0_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip8];
color=c=black@0.0:s=384x216:d=2[gap_3QZzrBNk];
color=c=black@0.0:s=384x216:d=0.5[void_clip1];
[void_clip1]fps=30[fps_void_clip1_vGQq6qok];
[clip1]fps=30[fps_clip1_0q9OvLBp];
[fps_void_clip1_vGQq6qok][fps_clip1_0q9OvLBp]xfade=transition=smoothup:duration=0.43333333333333335:offset=0,setpts=PTS-STARTPTS,fps=30[start_xfade_BBpPjFZ1];
color=c=black@0.0:s=384x216:d=0.5[void_start_xfade_BBpPjFZ1];
[start_xfade_BBpPjFZ1]fps=30[fps_start_xfade_BBpPjFZ1_dKA5sdwB];
[void_start_xfade_BBpPjFZ1]fps=30[fps_void_start_xfade_BBpPjFZ1_fIs0sjQN];
[fps_start_xfade_BBpPjFZ1_dKA5sdwB][fps_void_start_xfade_BBpPjFZ1_fIs0sjQN]xfade=transition=smoothdown:duration=0.43333333333333335:offset=1.5,setpts=PTS-STARTPTS,fps=30[end_xfade_Y6pXiYs0];
color=c=black@0.0:s=384x216:d=0.5[void_clip2];
[void_clip2]fps=30[fps_void_clip2_euecyV6b];
[clip2]fps=30[fps_clip2_sJaWpKEB];
[fps_void_clip2_euecyV6b][fps_clip2_sJaWpKEB]xfade=transition=fade:duration=0.43333333333333335:offset=0,setpts=PTS-STARTPTS,fps=30[start_xfade_M0kpIngw];
color=c=black@0.0:s=384x216:d=0.5[void_start_xfade_M0kpIngw];
[start_xfade_M0kpIngw]fps=30[fps_start_xfade_M0kpIngw_8yy9iPgC];
[void_start_xfade_M0kpIngw]fps=30[fps_void_start_xfade_M0kpIngw_RIfJZeqY];
[fps_start_xfade_M0kpIngw_8yy9iPgC][fps_void_start_xfade_M0kpIngw_RIfJZeqY]xfade=transition=circlecrop:duration=0.43333333333333335:offset=0.5,setpts=PTS-STARTPTS,fps=30[end_xfade_Ozndd475];
color=c=black@0.0:s=384x216:d=0.5[void_clip3];
[clip3]fps=30[fps_clip3_tHP3UErE];
[void_clip3]fps=30[fps_void_clip3_XboCS0fL];
[fps_clip3_tHP3UErE][fps_void_clip3_XboCS0fL]xfade=transition=squeezev:duration=0.43333333333333335:offset=4.5,setpts=PTS-STARTPTS,fps=30[end_xfade_5KJZKWUQ];
color=c=black@0.0:s=384x216:d=0.5[void_clip8];
[clip8]fps=30[fps_clip8_6EjPmCP4];
[void_clip8]fps=30[fps_void_clip8_24JsrvzG];
[fps_clip8_6EjPmCP4][fps_void_clip8_24JsrvzG]xfade=transition=smoothdown:duration=0.43333333333333335:offset=4.5,setpts=PTS-STARTPTS,fps=30[end_xfade_Ic9QIOPk];
[gap_Flov5cN6][end_xfade_Y6pXiYs0]concat=n=2:v=1:a=0,setpts=PTS-STARTPTS,fps=30[between_concat_6Ouo4Lzq];
[between_concat_6Ouo4Lzq][end_xfade_Ozndd475]concat=n=2:v=1:a=0,setpts=PTS-STARTPTS,fps=30[between_concat_83xdnUzh];
[between_concat_83xdnUzh][gap_G05u9yq0]concat=n=2:v=1:a=0,setpts=PTS-STARTPTS,fps=30[between_concat_qLBAGM35];
[between_concat_qLBAGM35][end_xfade_5KJZKWUQ]concat=n=2:v=1:a=0,setpts=PTS-STARTPTS,fps=30[between_concat_4adUloyI];
[between_concat_4adUloyI][clip4]concat=n=2:v=1:a=0,setpts=PTS-STARTPTS,fps=30[between_concat_437LEs54];
[between_concat_437LEs54]fps=30[fps_between_concat_437LEs54_r7nkw6Xp];
[clip5]fps=30[fps_clip5_ZE6QfBRM];
[fps_between_concat_437LEs54_r7nkw6Xp][fps_clip5_ZE6QfBRM]xfade=transition=fade:duration=1:offset=19,setpts=PTS-STARTPTS,fps=30[between_xfade_LZEa3Hq5];
[between_xfade_LZEa3Hq5]fps=30[fps_between_xfade_LZEa3Hq5_8VZQaSdk];
[clip6]fps=30[fps_clip6_6WdM5DcV];
[fps_between_xfade_LZEa3Hq5_8VZQaSdk][fps_clip6_6WdM5DcV]xfade=transition=smoothdown:duration=1:offset=23,setpts=PTS-STARTPTS,fps=30[between_xfade_LysE8a8q];
[between_xfade_LysE8a8q][clip7]concat=n=2:v=1:a=0,setpts=PTS-STARTPTS,fps=30[between_concat_woGZssob];
[between_concat_woGZssob][end_xfade_Ic9QIOPk]concat=n=2:v=1:a=0,setpts=PTS-STARTPTS,fps=30[between_concat_NVOu8PmU];
[between_concat_NVOu8PmU][gap_3QZzrBNk]concat=n=2:v=1:a=0,setpts=PTS-STARTPTS,fps=30[track_with_some_videos];
color=black@0.0:s=384x216:d=30[jrzlaAKI_base];
[6:v]loop=loop=900:size=900,setpts=PTS-STARTPTS,fps=30,scale=60:30,format=rgba,colorchannelmixer=aa=1[kK7AW75a_clip];
[jrzlaAKI_base][kK7AW75a_clip]overlay=322:2:format=auto,rotate=0,fps=30[watermark_clip];
color=c=black@0.0:s=384x216:d=10[gap_4iqftod7];
color=c=black@0.0:s=384x216:d=0.5[void_watermark_clip];
[watermark_clip]fps=30[fps_watermark_clip_ZKAOGXTQ];
[void_watermark_clip]fps=30[fps_void_watermark_clip_9zq824cP];
[fps_watermark_clip_ZKAOGXTQ][fps_void_watermark_clip_9zq824cP]xfade=transition=squeezeh:duration=0.43333333333333335:offset=29.5,setpts=PTS-STARTPTS,fps=30[end_xfade_wPjdMj5q];
[end_xfade_wPjdMj5q][gap_4iqftod7]concat=n=2:v=1:a=0,setpts=PTS-STARTPTS,fps=30[track_with_watermark];
[4:a]atrim=0:20,asetpts=PTS-STARTPTS,volume=1[audio_clip1];
[5:a]atrim=0:20,asetpts=PTS-STARTPTS,volume=1[audio_clip2];
[audio_clip1][audio_clip2]concat=n=2:v=0:a=1[track2];
[base][track_with_some_videos]overlay=0:0[msmF8Ecf_combined_track];
[msmF8Ecf_combined_track][track_with_watermark]overlay=0:0[video_output];
[track2]anull[audio_output];" \
-map '[video_output]' -map '[audio_output]' -c:v libx264 -c:a aac -b:a 320k -r 30 -s 384x216 -ss 0 -crf 23 -preset veryfast -pix_fmt yuv420p output.mp4
