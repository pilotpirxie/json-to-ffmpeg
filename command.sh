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
-filter_complex "color=c=black:s=960x540:d=100[base];
color=c=black@0.0:s=960x540:d=3[gap_BP6mu5Kd];
color=black@0.0:s=960x540:d=2[uO1AM1vE_base];
[0:v]scale=960:540,format=rgba,colorchannelmixer=aa=1[whlrj2xb_clip];
[uO1AM1vE_base][whlrj2xb_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip1];
color=black@0.0:s=960x540:d=1[920twccb_base];
[1:v]scale=960:540,format=rgba,colorchannelmixer=aa=1[G88L4TEC_clip];
[920twccb_base][G88L4TEC_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip2];
color=c=black@0.0:s=960x540:d=4[gap_CBDmilln];
color=black@0.0:s=960x540:d=5[rdBkaX9X_base];
[2:v]scale=480:270,format=rgba,colorchannelmixer=aa=0.5[TJ1gBf4T_clip];
[rdBkaX9X_base][TJ1gBf4T_clip]overlay=240:135:format=auto,rotate=45,fps=30[clip3];
color=black@0.0:s=960x540:d=5[GUr7Y11t_base];
[3:v]scale=960:540,format=rgba,colorchannelmixer=aa=1[5J5QBcPc_clip];
[GUr7Y11t_base][5J5QBcPc_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip4];
color=black@0.0:s=960x540:d=5[pfm1HRf6_base];
[4:v]scale=200:150,format=rgba,colorchannelmixer=aa=1[SECTubdQ_clip];
[pfm1HRf6_base][SECTubdQ_clip]overlay=25:25:format=auto,rotate=0,fps=30[clip5];
color=black@0.0:s=960x540:d=5[4WKf6g01_base];
[5:v]scale=960:540,format=rgba,colorchannelmixer=aa=1[mT8lGyvI_clip];
[4WKf6g01_base][mT8lGyvI_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip6];
color=black@0.0:s=960x540:d=5[ziOCcWQN_base];
[6:v]scale=960:540,format=rgba,colorchannelmixer=aa=1[I9gTmFdu_clip];
[ziOCcWQN_base][I9gTmFdu_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip7];
color=black@0.0:s=960x540:d=5[Xyxn6IPw_base];
[7:v]scale=960:540,format=rgba,colorchannelmixer=aa=1[iRXa2MUV_clip];
[Xyxn6IPw_base][iRXa2MUV_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip8];
color=c=black@0.0:s=960x540:d=62[gap_bUwH5cfg];
color=c=black@0.0:s=960x540:d=0.5[void_clip1];
[void_clip1]fps=30[fps_void_clip1_VPLmMn2X];
[clip1]fps=30[fps_clip1_Am5BZPqB];
[fps_void_clip1_VPLmMn2X][fps_clip1_Am5BZPqB]xfade=transition=smoothup:duration=0.43333333333333335:offset=0,fps=30[start_xfade_lG38kGzb];
color=c=black@0.0:s=960x540:d=0.5[void_start_xfade_lG38kGzb];
[start_xfade_lG38kGzb]fps=30[fps_start_xfade_lG38kGzb_iS4t50Iu];
[void_start_xfade_lG38kGzb]fps=30[fps_void_start_xfade_lG38kGzb_a5Bz5kjt];
[fps_start_xfade_lG38kGzb_iS4t50Iu][fps_void_start_xfade_lG38kGzb_a5Bz5kjt]xfade=transition=smoothdown:duration=0.43333333333333335:offset=1.5,fps=30[end_xfade_qA54qPzJ];
color=c=black@0.0:s=960x540:d=0.5[void_clip2];
[void_clip2]fps=30[fps_void_clip2_582syLzx];
[clip2]fps=30[fps_clip2_Olmy0sqH];
[fps_void_clip2_582syLzx][fps_clip2_Olmy0sqH]xfade=transition=fade:duration=0.43333333333333335:offset=0,fps=30[start_xfade_5AhfqVW8];
color=c=black@0.0:s=960x540:d=0.5[void_start_xfade_5AhfqVW8];
[start_xfade_5AhfqVW8]fps=30[fps_start_xfade_5AhfqVW8_0rYEO53B];
[void_start_xfade_5AhfqVW8]fps=30[fps_void_start_xfade_5AhfqVW8_8uriixSi];
[fps_start_xfade_5AhfqVW8_0rYEO53B][fps_void_start_xfade_5AhfqVW8_8uriixSi]xfade=transition=circlecrop:duration=0.43333333333333335:offset=0.5,fps=30[end_xfade_LEFxWc1V];
color=c=black@0.0:s=960x540:d=0.5[void_clip3];
[clip3]fps=30[fps_clip3_FmeflSvN];
[void_clip3]fps=30[fps_void_clip3_hXImEfcV];
[fps_clip3_FmeflSvN][fps_void_clip3_hXImEfcV]xfade=transition=squeezev:duration=0.43333333333333335:offset=4.5,fps=30[end_xfade_3t7ne3fO];
color=c=black@0.0:s=960x540:d=0.5[void_clip8];
[clip8]fps=30[fps_clip8_RY8XWdGx];
[void_clip8]fps=30[fps_void_clip8_6XovU9Hd];
[fps_clip8_RY8XWdGx][fps_void_clip8_6XovU9Hd]xfade=transition=smoothdown:duration=0.43333333333333335:offset=4.5,fps=30[end_xfade_edNidoHq];
[gap_BP6mu5Kd][end_xfade_qA54qPzJ]concat=n=2:v=1:a=0,fps=30[between_concat_TjF8Si77];
[between_concat_TjF8Si77][end_xfade_LEFxWc1V]concat=n=2:v=1:a=0,fps=30[between_concat_tFA1yaD2];
[between_concat_tFA1yaD2][gap_CBDmilln]concat=n=2:v=1:a=0,fps=30[between_concat_0m92190S];
[between_concat_0m92190S][end_xfade_3t7ne3fO]concat=n=2:v=1:a=0,fps=30[between_concat_wYhhZ6xT];
[between_concat_wYhhZ6xT][clip4]concat=n=2:v=1:a=0,fps=30[between_concat_5H8dpbXG];
[between_concat_5H8dpbXG]fps=30[fps_between_concat_5H8dpbXG_NKRCRxri];
[clip5]fps=30[fps_clip5_id2Wk8MF];
[fps_between_concat_5H8dpbXG_NKRCRxri][fps_clip5_id2Wk8MF]xfade=transition=fade:duration=1:offset=19,fps=30[between_xfade_AGd5xwwa];
[between_xfade_AGd5xwwa]fps=30[fps_between_xfade_AGd5xwwa_zbJKSmIH];
[clip6]fps=30[fps_clip6_WlTON2C6];
[fps_between_xfade_AGd5xwwa_zbJKSmIH][fps_clip6_WlTON2C6]xfade=transition=smoothdown:duration=1:offset=23,fps=30[between_xfade_uKhqrYpI];
[between_xfade_uKhqrYpI][clip7]concat=n=2:v=1:a=0,fps=30[between_concat_ZFShccyg];
[between_concat_ZFShccyg][end_xfade_edNidoHq]concat=n=2:v=1:a=0,fps=30[between_concat_OQw3j54N];
[between_concat_OQw3j54N][gap_bUwH5cfg]concat=n=2:v=1:a=0,fps=30[track_with_some_videos];
color=black@0.0:s=960x540:d=100[hywPNTv2_base];
[10:v]loop=loop=3000:size=3000,setpts=PTS-STARTPTS,fps=30,scale=150:75,format=rgba,colorchannelmixer=aa=1[p54FlTX4_clip];
[hywPNTv2_base][p54FlTX4_clip]overlay=805:5:format=auto,rotate=0,fps=30[watermark_clip];
[watermark_clip]setpts=PTS-STARTPTS[track_with_watermark];
anullsrc=channel_layout=stereo:sample_rate=44100:d=5[gap_T5vERdVz];
[8:a]atrim=0:10,asetpts=PTS-STARTPTS,volume=1[audio_clip1];
anullsrc=channel_layout=stereo:sample_rate=44100:d=5[gap_GVmswOoj];
[9:a]atrim=0:15,asetpts=PTS-STARTPTS,volume=1[audio_clip2];
anullsrc=channel_layout=stereo:sample_rate=44100:d=65[gap_wDo2c8AP];
[gap_T5vERdVz][audio_clip1][gap_GVmswOoj][audio_clip2][gap_wDo2c8AP]concat=n=5:v=0:a=1[track2];
[base][track_with_some_videos]overlay=0:0[vXA4AZ7L_combined_track];
[vXA4AZ7L_combined_track][track_with_watermark]overlay=0:0[video_output];
[track2]volume=1[audio_output];" \
-map '[video_output]' -map '[audio_output]' -c:v libx264 -c:a aac -b:a 320k -r 30 -s 960x540 -ss 0 -t 38 -crf 23 -preset veryfast -pix_fmt yuv420p output.mp4
