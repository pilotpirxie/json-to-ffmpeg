#!/bin/bash
ffmpeg -y \
-i samples/bee1920.mp4 \
-i samples/book1920.mp4 \
-i samples/cows1920.mp4 \
-i samples/flowers1920.mp4 \
-i samples/ever.mp3 \
-i samples/weekend.mp3 \
-i samples/flower.png \
-filter_complex "color=c=black:s=384x216:d=39[base];
color=c=black@0.0:s=384x216:d=3[gap_0e7GysYw];
color=black@0.0:s=384x216:d=2[jFJKKjyW_base];
[0:v]trim=10:12,setpts=PTS-STARTPTS,fps=30,scale=384:216,format=rgba,colorchannelmixer=aa=1[IuFEA1C8_clip];
[jFJKKjyW_base][IuFEA1C8_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip1];
color=black@0.0:s=384x216:d=1[g9ZQS0wN_base];
[1:v]trim=5:6,setpts=PTS-STARTPTS,fps=30,scale=384:216,format=rgba,colorchannelmixer=aa=1[lEny0TGF_clip];
[g9ZQS0wN_base][lEny0TGF_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip2];
color=c=black@0.0:s=384x216:d=4[gap_42Ub9fCc];
color=black@0.0:s=384x216:d=5[Nol58JLj_base];
[2:v]trim=3:8,setpts=PTS-STARTPTS,fps=30,scale=192:108,format=rgba,colorchannelmixer=aa=0.5[TCj0sgMA_clip];
[Nol58JLj_base][TCj0sgMA_clip]overlay=96:54:format=auto,rotate=45,fps=30[clip3];
color=black@0.0:s=384x216:d=5[KQDQyp9X_base];
[0:v]trim=27:32,setpts=PTS-STARTPTS,fps=30,scale=384:216,format=rgba,colorchannelmixer=aa=1[SjxQON7I_clip];
[KQDQyp9X_base][SjxQON7I_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip4];
color=black@0.0:s=384x216:d=5[8vgQ6TFv_base];
[1:v]trim=0:5,setpts=PTS-STARTPTS,fps=30,scale=80:60,format=rgba,colorchannelmixer=aa=1[R48sBQ2u_clip];
[8vgQ6TFv_base][R48sBQ2u_clip]overlay=10:10:format=auto,rotate=0,fps=30[clip5];
color=black@0.0:s=384x216:d=5[2lkpfV0W_base];
[3:v]trim=15:20,setpts=PTS-STARTPTS,fps=30,scale=384:216,format=rgba,colorchannelmixer=aa=1[2dOyY9gO_clip];
[2lkpfV0W_base][2dOyY9gO_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip6];
color=black@0.0:s=384x216:d=5[FdFxHNdW_base];
[3:v]trim=0:5,setpts=PTS-STARTPTS,fps=30,scale=384:216,format=rgba,colorchannelmixer=aa=1[wPn67dNh_clip];
[FdFxHNdW_base][wPn67dNh_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip7];
color=black@0.0:s=384x216:d=5[s8cuFXug_base];
[3:v]trim=10:15,setpts=PTS-STARTPTS,fps=30,scale=384:216,format=rgba,colorchannelmixer=aa=1[5FHNazBN_clip];
[s8cuFXug_base][5FHNazBN_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip8];
color=c=black@0.0:s=384x216:d=0.5[void_clip1];
[void_clip1]fps=30[fps_void_clip1_UE7icgp7];
[clip1]fps=30[fps_clip1_RfdswJQE];
[fps_void_clip1_UE7icgp7][fps_clip1_RfdswJQE]xfade=transition=smoothup:duration=0.43333333333333335:offset=0,fps=30[start_xfade_PtUcR8zU];
color=c=black@0.0:s=384x216:d=0.5[void_start_xfade_PtUcR8zU];
[start_xfade_PtUcR8zU]fps=30[fps_start_xfade_PtUcR8zU_G2XOHCA4];
[void_start_xfade_PtUcR8zU]fps=30[fps_void_start_xfade_PtUcR8zU_Psb1oYmh];
[fps_start_xfade_PtUcR8zU_G2XOHCA4][fps_void_start_xfade_PtUcR8zU_Psb1oYmh]xfade=transition=smoothdown:duration=0.43333333333333335:offset=1.5,fps=30[end_xfade_T7CQxNF5];
color=c=black@0.0:s=384x216:d=0.5[void_clip2];
[void_clip2]fps=30[fps_void_clip2_7cDC6NPu];
[clip2]fps=30[fps_clip2_K08fGAhu];
[fps_void_clip2_7cDC6NPu][fps_clip2_K08fGAhu]xfade=transition=fade:duration=0.43333333333333335:offset=0,fps=30[start_xfade_S1F8Jbuf];
color=c=black@0.0:s=384x216:d=0.5[void_start_xfade_S1F8Jbuf];
[start_xfade_S1F8Jbuf]fps=30[fps_start_xfade_S1F8Jbuf_apeoXCUz];
[void_start_xfade_S1F8Jbuf]fps=30[fps_void_start_xfade_S1F8Jbuf_e3w1jPO4];
[fps_start_xfade_S1F8Jbuf_apeoXCUz][fps_void_start_xfade_S1F8Jbuf_e3w1jPO4]xfade=transition=circlecrop:duration=0.43333333333333335:offset=0.5,fps=30[end_xfade_bPlFDOtd];
color=c=black@0.0:s=384x216:d=0.5[void_clip3];
[clip3]fps=30[fps_clip3_7WtLHhcq];
[void_clip3]fps=30[fps_void_clip3_UY1UHYoO];
[fps_clip3_7WtLHhcq][fps_void_clip3_UY1UHYoO]xfade=transition=squeezev:duration=0.43333333333333335:offset=4.5,fps=30[end_xfade_kFDevzx9];
color=c=black@0.0:s=384x216:d=0.5[void_clip8];
[clip8]fps=30[fps_clip8_pX6uyYv8];
[void_clip8]fps=30[fps_void_clip8_Mu0HrZCA];
[fps_clip8_pX6uyYv8][fps_void_clip8_Mu0HrZCA]xfade=transition=smoothdown:duration=0.43333333333333335:offset=4.5,fps=30[end_xfade_lWy3koO4];
[gap_0e7GysYw][end_xfade_T7CQxNF5]concat=n=2:v=1:a=0[between_concat_UcHIuZtW];
[between_concat_UcHIuZtW][end_xfade_bPlFDOtd]concat=n=2:v=1:a=0[between_concat_Cmc2dAas];
[between_concat_Cmc2dAas][gap_42Ub9fCc]concat=n=2:v=1:a=0[between_concat_DHI00JTn];
[between_concat_DHI00JTn][end_xfade_kFDevzx9]concat=n=2:v=1:a=0[between_concat_7VS7N7zs];
[between_concat_7VS7N7zs][clip4]concat=n=2:v=1:a=0[between_concat_HZBgwhGz];
[between_concat_HZBgwhGz]fps=30[fps_between_concat_HZBgwhGz_csZjOHDJ];
[clip5]fps=30[fps_clip5_IbYbNov7];
[fps_between_concat_HZBgwhGz_csZjOHDJ][fps_clip5_IbYbNov7]xfade=transition=fade:duration=0.5:offset=19.5,fps=30[between_xfade_yWrQZ0z1];
[between_xfade_yWrQZ0z1]fps=30[fps_between_xfade_yWrQZ0z1_YcIRD8ev];
[clip6]fps=30[fps_clip6_jIvlvFZe];
[fps_between_xfade_yWrQZ0z1_YcIRD8ev][fps_clip6_jIvlvFZe]xfade=transition=smoothdown:duration=0.5:offset=24.5,fps=30[between_xfade_0kXBaVnE];
[between_xfade_0kXBaVnE][clip7]concat=n=2:v=1:a=0[between_concat_3QG44cbF];
[between_concat_3QG44cbF][end_xfade_lWy3koO4]concat=n=2:v=1:a=0[track_with_some_videos];
color=black@0.0:s=384x216:d=30[KIsJnla6_base];
[6:v]loop=loop=900:size=900,setpts=PTS-STARTPTS,fps=30,scale=60:30,format=rgba,colorchannelmixer=aa=1[y5ucYcXU_clip];
[KIsJnla6_base][y5ucYcXU_clip]overlay=322:2:format=auto,rotate=0,fps=30[watermark_clip];
color=c=black@0.0:s=384x216:d=9[gap_sBiTfdbu];
color=c=black@0.0:s=384x216:d=0.5[void_watermark_clip];
[watermark_clip]fps=30[fps_watermark_clip_rIoN4Qjo];
[void_watermark_clip]fps=30[fps_void_watermark_clip_gotRCM33];
[fps_watermark_clip_rIoN4Qjo][fps_void_watermark_clip_gotRCM33]xfade=transition=squeezeh:duration=0.43333333333333335:offset=29.5,fps=30[end_xfade_Hm4TJwrT];
[end_xfade_Hm4TJwrT][gap_sBiTfdbu]concat=n=2:v=1:a=0[track_with_watermark];
[4:a]atrim=0:20,asetpts=PTS-STARTPTS,volume=1[audio_clip1];
[5:a]atrim=0:20,asetpts=PTS-STARTPTS,volume=1[audio_clip2];
[audio_clip1][audio_clip2]concat=n=2:v=0:a=1[track2];
[base][track_with_some_videos]overlay=0:0[2M67iDfZ_combined_track];
[2M67iDfZ_combined_track][track_with_watermark]overlay=0:0[video_output];
[track2]anull[audio_output];" \
-map '[video_output]' -map '[audio_output]' -c:v libx264 -c:a aac -b:a 320k -r 30 -s 384x216 -ss 0 -t 40 -crf 23 -preset veryfast -pix_fmt yuv420p output.mp4
