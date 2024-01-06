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
color=c=black@0.0:s=1920x1080:d=3[gap_87SGXBk2];
color=black@0.0:s=1920x1080:d=2[9hEhkQ8V_base];
[0:v]trim=10:12,setpts=PTS-STARTPTS,fps=30,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[wYHXf8w6_clip];
[9hEhkQ8V_base][wYHXf8w6_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip1];
color=black@0.0:s=1920x1080:d=1[nGCENq1r_base];
[1:v]trim=5:6,setpts=PTS-STARTPTS,fps=30,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[nGJ0Mbfo_clip];
[nGCENq1r_base][nGJ0Mbfo_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip2];
color=c=black@0.0:s=1920x1080:d=4[gap_I5D56vHS];
color=black@0.0:s=1920x1080:d=5[BX5X0SRL_base];
[2:v]trim=3:8,setpts=PTS-STARTPTS,fps=30,scale=960:540,format=rgba,colorchannelmixer=aa=0.5[viSvAeZ6_clip];
[BX5X0SRL_base][viSvAeZ6_clip]overlay=480:270:format=auto,rotate=45,fps=30[clip3];
color=black@0.0:s=1920x1080:d=5[HZqfYKxR_base];
[0:v]trim=27:32,setpts=PTS-STARTPTS,fps=30,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[cvScGSdq_clip];
[HZqfYKxR_base][cvScGSdq_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip4];
color=black@0.0:s=1920x1080:d=5[vVvy64en_base];
[1:v]trim=0:5,setpts=PTS-STARTPTS,fps=30,scale=400:300,format=rgba,colorchannelmixer=aa=1[5kvKD40v_clip];
[vVvy64en_base][5kvKD40v_clip]overlay=50:50:format=auto,rotate=0,fps=30[clip5];
color=black@0.0:s=1920x1080:d=5[8UqFqlNL_base];
[3:v]trim=15:20,setpts=PTS-STARTPTS,fps=30,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[MDEXNsSv_clip];
[8UqFqlNL_base][MDEXNsSv_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip6];
color=black@0.0:s=1920x1080:d=5[akHAMH5N_base];
[3:v]trim=0:5,setpts=PTS-STARTPTS,fps=30,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[mUhEcEpA_clip];
[akHAMH5N_base][mUhEcEpA_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip7];
color=black@0.0:s=1920x1080:d=5[RfPisv5D_base];
[3:v]trim=10:15,setpts=PTS-STARTPTS,fps=30,scale=1920:1080,format=rgba,colorchannelmixer=aa=1[QGqgjaNg_clip];
[RfPisv5D_base][QGqgjaNg_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip8];
color=c=black@0.0:s=1920x1080:d=0.5[void_clip1];
[void_clip1]fps=30[fps_void_clip1_fKQ28V4z];
[clip1]fps=30[fps_clip1_6PWyGlbL];
[fps_void_clip1_fKQ28V4z][fps_clip1_6PWyGlbL]xfade=transition=smoothup:duration=0.43333333333333335:offset=0,fps=30[start_xfade_dUNBH6to];
color=c=black@0.0:s=1920x1080:d=0.5[void_start_xfade_dUNBH6to];
[start_xfade_dUNBH6to]fps=30[fps_start_xfade_dUNBH6to_XuIYXiog];
[void_start_xfade_dUNBH6to]fps=30[fps_void_start_xfade_dUNBH6to_ddUzkJnb];
[fps_start_xfade_dUNBH6to_XuIYXiog][fps_void_start_xfade_dUNBH6to_ddUzkJnb]xfade=transition=smoothdown:duration=0.43333333333333335:offset=1.5,fps=30[end_xfade_MEfPY3vh];
color=c=black@0.0:s=1920x1080:d=0.5[void_clip2];
[void_clip2]fps=30[fps_void_clip2_f41Uu9ao];
[clip2]fps=30[fps_clip2_MwKp7irI];
[fps_void_clip2_f41Uu9ao][fps_clip2_MwKp7irI]xfade=transition=fade:duration=0.43333333333333335:offset=0,fps=30[start_xfade_AzAuslN0];
color=c=black@0.0:s=1920x1080:d=0.5[void_start_xfade_AzAuslN0];
[start_xfade_AzAuslN0]fps=30[fps_start_xfade_AzAuslN0_qLlghOGI];
[void_start_xfade_AzAuslN0]fps=30[fps_void_start_xfade_AzAuslN0_KUx3INXT];
[fps_start_xfade_AzAuslN0_qLlghOGI][fps_void_start_xfade_AzAuslN0_KUx3INXT]xfade=transition=circlecrop:duration=0.43333333333333335:offset=0.5,fps=30[end_xfade_MVajy4fF];
color=c=black@0.0:s=1920x1080:d=0.5[void_clip3];
[clip3]fps=30[fps_clip3_mOaIPSut];
[void_clip3]fps=30[fps_void_clip3_QRWeK9Ul];
[fps_clip3_mOaIPSut][fps_void_clip3_QRWeK9Ul]xfade=transition=squeezev:duration=0.43333333333333335:offset=4.5,fps=30[end_xfade_JV9KexjK];
[gap_87SGXBk2][end_xfade_MEfPY3vh]concat=n=2:v=1:a=0[between_concat_v6bRBHaN];
[between_concat_v6bRBHaN][end_xfade_MVajy4fF]concat=n=2:v=1:a=0[between_concat_Pw6GXiDx];
[between_concat_Pw6GXiDx][gap_I5D56vHS]concat=n=2:v=1:a=0[between_concat_zi5wqPlI];
[between_concat_zi5wqPlI][end_xfade_JV9KexjK]concat=n=2:v=1:a=0[between_concat_E6DzN6dY];
[between_concat_E6DzN6dY][clip4]concat=n=2:v=1:a=0[between_concat_RZWpLbSh];
[between_concat_RZWpLbSh]fps=30[fps_between_concat_RZWpLbSh_WFfBwgyG];
[clip5]fps=30[fps_clip5_uMSAMotK];
[fps_between_concat_RZWpLbSh_WFfBwgyG][fps_clip5_uMSAMotK]xfade=transition=fade:duration=0.5:offset=19.5,fps=30[between_xfade_S9eQs8Z6];
[between_xfade_S9eQs8Z6]fps=30[fps_between_xfade_S9eQs8Z6_qiWY0b1y];
[clip6]fps=30[fps_clip6_KvkH0mhe];
[fps_between_xfade_S9eQs8Z6_qiWY0b1y][fps_clip6_KvkH0mhe]xfade=transition=smoothdown:duration=0.5:offset=24.5,fps=30[between_xfade_uzubOEj6];
[between_xfade_uzubOEj6][clip7]concat=n=2:v=1:a=0[between_concat_iY8iToJ9];
[between_concat_iY8iToJ9][clip8]concat=n=2:v=1:a=0[track_with_some_videos];
color=black@0.0:s=1920x1080:d=30[PTav4PbG_base];
[6:v]loop=loop=900:size=900,setpts=PTS-STARTPTS,fps=30,scale=300:150,format=rgba,colorchannelmixer=aa=1[XEeWKs0s_clip];
[PTav4PbG_base][XEeWKs0s_clip]overlay=1610:10:format=auto,rotate=0,fps=30[watermark_clip];
color=c=black@0.0:s=1920x1080:d=10[gap_YP6jKYkJ];
color=c=black@0.0:s=1920x1080:d=0.5[void_watermark_clip];
[watermark_clip]fps=30[fps_watermark_clip_lAKv1J6Y];
[void_watermark_clip]fps=30[fps_void_watermark_clip_e0RofMOn];
[fps_watermark_clip_lAKv1J6Y][fps_void_watermark_clip_e0RofMOn]xfade=transition=squeezeh:duration=0.43333333333333335:offset=29.5,fps=30[end_xfade_xn4SeqsG];
[end_xfade_xn4SeqsG][gap_YP6jKYkJ]concat=n=2:v=1:a=0[track_with_watermark];
[4:a]atrim=0:20,asetpts=PTS-STARTPTS,volume=1[audio_clip1];
[5:a]atrim=0:20,asetpts=PTS-STARTPTS,volume=1[audio_clip2];
[audio_clip1][audio_clip2]concat=n=2:v=0:a=1[track2];
[base][track_with_some_videos]overlay=0:0[xLk6Uq2k_combined_track];
[xLk6Uq2k_combined_track][track_with_watermark]overlay=0:0[video_output];
[track2]anull[audio_output];" \
-map '[video_output]' -map '[audio_output]' -c:v libx264 -c:a aac -b:a 320k -r 30 -s 1920x1080 -ss 0 -t 35 -crf 23 -preset veryfast -pix_fmt yuv420p output.mp4
