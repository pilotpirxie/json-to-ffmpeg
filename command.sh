#!/bin/bash
mkdir -p ./tmp
ffmpeg -y -i samples/bee1920.mp4 -ss 10 -t 2 -r 30 ./tmp/clip1.mp4
ffmpeg -y -i samples/book1920.mp4 -ss 5 -t 1 -r 30 ./tmp/clip2.mp4
ffmpeg -y -i samples/cows1920.mp4 -ss 3 -t 5 -r 30 ./tmp/clip3.mp4
ffmpeg -y -i samples/bee1920.mp4 -ss 27 -t 5 -r 30 ./tmp/clip4.mp4
ffmpeg -y -i samples/book1920.mp4 -ss 0 -t 5 -r 30 ./tmp/clip5.mp4
ffmpeg -y -i samples/flowers1920.mp4 -ss 15 -t 5 -r 30 ./tmp/clip6.mp4
ffmpeg -y -i samples/cows1920.mp4 -ss 0 -t 5 -r 30 ./tmp/clip7.mp4
ffmpeg -y -i samples/bee1920.mp4 -ss 0 -t 5 -r 30 ./tmp/clip8.mp4
ffmpeg -y \
-i ./tmp/clip1.mp4 \
-i ./tmp/clip2.mp4 \
-i ./tmp/clip3.mp4 \
-i ./tmp/clip4.mp4 \
-i ./tmp/clip5.mp4 \
-i ./tmp/clip6.mp4 \
-i ./tmp/clip7.mp4 \
-i ./tmp/clip8.mp4 \
-i samples/ever.mp3 \
-i samples/weekend.mp3 \
-i samples/flower.png \
-filter_complex "color=c=black:s=384x216:d=38[base];
color=c=black@0.0:s=384x216:d=3[gap_dCD4dV0F];
color=black@0.0:s=384x216:d=2[ZeXT01oP_base];
[0:v]scale=384:216,format=rgba,colorchannelmixer=aa=1[hsM0YRII_clip];
[ZeXT01oP_base][hsM0YRII_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip1];
color=black@0.0:s=384x216:d=1[cqehIvPo_base];
[1:v]scale=384:216,format=rgba,colorchannelmixer=aa=1[Xl2uGMjn_clip];
[cqehIvPo_base][Xl2uGMjn_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip2];
color=c=black@0.0:s=384x216:d=4[gap_lAF4pNOI];
color=black@0.0:s=384x216:d=5[0NLgKsuX_base];
[2:v]scale=192:108,format=rgba,colorchannelmixer=aa=0.5[X8085UOn_clip];
[0NLgKsuX_base][X8085UOn_clip]overlay=96:54:format=auto,rotate=45,fps=30[clip3];
color=black@0.0:s=384x216:d=5[X61ujzUv_base];
[3:v]scale=384:216,format=rgba,colorchannelmixer=aa=1[shyWXPTv_clip];
[X61ujzUv_base][shyWXPTv_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip4];
color=black@0.0:s=384x216:d=5[Rlrv5FdL_base];
[4:v]scale=80:60,format=rgba,colorchannelmixer=aa=1[iLjGwOCc_clip];
[Rlrv5FdL_base][iLjGwOCc_clip]overlay=10:10:format=auto,rotate=0,fps=30[clip5];
color=black@0.0:s=384x216:d=5[LAOwJiup_base];
[5:v]scale=384:216,format=rgba,colorchannelmixer=aa=1[3GSzocWC_clip];
[LAOwJiup_base][3GSzocWC_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip6];
color=black@0.0:s=384x216:d=5[RjnaYQNO_base];
[6:v]scale=384:216,format=rgba,colorchannelmixer=aa=1[QrTzlNOM_clip];
[RjnaYQNO_base][QrTzlNOM_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip7];
color=black@0.0:s=384x216:d=5[lJAJLLzi_base];
[7:v]scale=384:216,format=rgba,colorchannelmixer=aa=1[JXbyWhzM_clip];
[lJAJLLzi_base][JXbyWhzM_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip8];
color=c=black@0.0:s=384x216:d=0.5[void_clip1];
[void_clip1]fps=30[fps_void_clip1_jUQyaOh7];
[clip1]fps=30[fps_clip1_dGXGJPKA];
[fps_void_clip1_jUQyaOh7][fps_clip1_dGXGJPKA]xfade=transition=smoothup:duration=0.43333333333333335:offset=0,fps=30[start_xfade_X0VRjQVF];
color=c=black@0.0:s=384x216:d=0.5[void_start_xfade_X0VRjQVF];
[start_xfade_X0VRjQVF]fps=30[fps_start_xfade_X0VRjQVF_ntQJoAXQ];
[void_start_xfade_X0VRjQVF]fps=30[fps_void_start_xfade_X0VRjQVF_diYGfXfe];
[fps_start_xfade_X0VRjQVF_ntQJoAXQ][fps_void_start_xfade_X0VRjQVF_diYGfXfe]xfade=transition=smoothdown:duration=0.43333333333333335:offset=1.5,fps=30[end_xfade_MNGDH5ZI];
color=c=black@0.0:s=384x216:d=0.5[void_clip2];
[void_clip2]fps=30[fps_void_clip2_VCqzsrKt];
[clip2]fps=30[fps_clip2_gnFrZGtx];
[fps_void_clip2_VCqzsrKt][fps_clip2_gnFrZGtx]xfade=transition=fade:duration=0.43333333333333335:offset=0,fps=30[start_xfade_5QtPl3lt];
color=c=black@0.0:s=384x216:d=0.5[void_start_xfade_5QtPl3lt];
[start_xfade_5QtPl3lt]fps=30[fps_start_xfade_5QtPl3lt_UTa03T00];
[void_start_xfade_5QtPl3lt]fps=30[fps_void_start_xfade_5QtPl3lt_sFyFQmzs];
[fps_start_xfade_5QtPl3lt_UTa03T00][fps_void_start_xfade_5QtPl3lt_sFyFQmzs]xfade=transition=circlecrop:duration=0.43333333333333335:offset=0.5,fps=30[end_xfade_ii00mjle];
color=c=black@0.0:s=384x216:d=0.5[void_clip3];
[clip3]fps=30[fps_clip3_dDhB1WcR];
[void_clip3]fps=30[fps_void_clip3_EvsBo6Y0];
[fps_clip3_dDhB1WcR][fps_void_clip3_EvsBo6Y0]xfade=transition=squeezev:duration=0.43333333333333335:offset=4.5,fps=30[end_xfade_3PfkHc83];
color=c=black@0.0:s=384x216:d=0.5[void_clip8];
[clip8]fps=30[fps_clip8_8rZAm8oC];
[void_clip8]fps=30[fps_void_clip8_aeNUvD6f];
[fps_clip8_8rZAm8oC][fps_void_clip8_aeNUvD6f]xfade=transition=smoothdown:duration=0.43333333333333335:offset=4.5,fps=30[end_xfade_7oJZPH1q];
[gap_dCD4dV0F][end_xfade_MNGDH5ZI]concat=n=2:v=1:a=0,fps=30[between_concat_XKn3bs4P];
[between_concat_XKn3bs4P][end_xfade_ii00mjle]concat=n=2:v=1:a=0,fps=30[between_concat_ip9jzojz];
[between_concat_ip9jzojz][gap_lAF4pNOI]concat=n=2:v=1:a=0,fps=30[between_concat_GotCSxJT];
[between_concat_GotCSxJT][end_xfade_3PfkHc83]concat=n=2:v=1:a=0,fps=30[between_concat_LSrGYwvx];
[between_concat_LSrGYwvx][clip4]concat=n=2:v=1:a=0,fps=30[between_concat_HLPMq6ku];
[between_concat_HLPMq6ku]fps=30[fps_between_concat_HLPMq6ku_kH9SYWBw];
[clip5]fps=30[fps_clip5_9MoIfADi];
[fps_between_concat_HLPMq6ku_kH9SYWBw][fps_clip5_9MoIfADi]xfade=transition=fade:duration=1:offset=19,fps=30[between_xfade_MBhKxcJr];
[between_xfade_MBhKxcJr]fps=30[fps_between_xfade_MBhKxcJr_hYMa6xh4];
[clip6]fps=30[fps_clip6_QOzL3zVW];
[fps_between_xfade_MBhKxcJr_hYMa6xh4][fps_clip6_QOzL3zVW]xfade=transition=smoothdown:duration=1:offset=23,fps=30[between_xfade_veBmhpkX];
[between_xfade_veBmhpkX][clip7]concat=n=2:v=1:a=0,fps=30[between_concat_Swbebhsk];
[between_concat_Swbebhsk][end_xfade_7oJZPH1q]concat=n=2:v=1:a=0,fps=30[track_with_some_videos];
color=black@0.0:s=384x216:d=30[hIr8xgQG_base];
[10:v]loop=loop=900:size=900,setpts=PTS-STARTPTS,fps=30,scale=60:30,format=rgba,colorchannelmixer=aa=1[DO3p8LXy_clip];
[hIr8xgQG_base][DO3p8LXy_clip]overlay=322:2:format=auto,rotate=0,fps=30[watermark_clip];
color=c=black@0.0:s=384x216:d=8[gap_s362gm7P];
color=c=black@0.0:s=384x216:d=0.5[void_watermark_clip];
[watermark_clip]fps=30[fps_watermark_clip_7sL0xZTc];
[void_watermark_clip]fps=30[fps_void_watermark_clip_UbN5zWgo];
[fps_watermark_clip_7sL0xZTc][fps_void_watermark_clip_UbN5zWgo]xfade=transition=squeezeh:duration=0.43333333333333335:offset=29.5,fps=30[end_xfade_izVPnCo8];
[end_xfade_izVPnCo8][gap_s362gm7P]concat=n=2:v=1:a=0,fps=30[track_with_watermark];
anullsrc=channel_layout=stereo:sample_rate=44100:d=5[gap_goN50RU3];
[8:a]atrim=0:10,asetpts=PTS-STARTPTS,volume=1[audio_clip1];
anullsrc=channel_layout=stereo:sample_rate=44100:d=5[gap_3EO6a9HM];
[9:a]atrim=0:15,asetpts=PTS-STARTPTS,volume=1[audio_clip2];
anullsrc=channel_layout=stereo:sample_rate=44100:d=3[gap_029hv01q];
[gap_goN50RU3][audio_clip1][gap_3EO6a9HM][audio_clip2][gap_029hv01q]concat=n=5:v=0:a=1[track2];
[base][track_with_some_videos]overlay=0:0[SKaGSe2P_combined_track];
[SKaGSe2P_combined_track][track_with_watermark]overlay=0:0[video_output];
[track2]volume=1[audio_output];" \
-map '[video_output]' -map '[audio_output]' -c:v libx264 -c:a aac -b:a 320k -r 30 -s 384x216 -ss 0 -t 40 -crf 23 -preset veryfast -pix_fmt yuv420p output.mp4
