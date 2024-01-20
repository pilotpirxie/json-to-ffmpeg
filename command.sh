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
-filter_complex "color=c=black:s=960x540:d=38[base];
color=c=black@0.0:s=960x540:d=3[gap_vyacld9R];
color=black@0.0:s=960x540:d=2[8XrgF3sn_base];
[0:v]scale=960:540,format=rgba,colorchannelmixer=aa=1[hVcVZ27q_clip];
[8XrgF3sn_base][hVcVZ27q_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip1];
color=black@0.0:s=960x540:d=1[RDBVRQnc_base];
[1:v]scale=960:540,format=rgba,colorchannelmixer=aa=1[wEeaeIiD_clip];
[RDBVRQnc_base][wEeaeIiD_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip2];
color=c=black@0.0:s=960x540:d=4[gap_bnT3dqMs];
color=black@0.0:s=960x540:d=5[8FI5tGFk_base];
[2:v]scale=480:270,format=rgba,colorchannelmixer=aa=0.5[OlDUGITy_clip];
[8FI5tGFk_base][OlDUGITy_clip]overlay=240:135:format=auto,rotate=45,fps=30[clip3];
color=black@0.0:s=960x540:d=5[zxjVkpSc_base];
[3:v]scale=960:540,format=rgba,colorchannelmixer=aa=1[spfFzWW2_clip];
[zxjVkpSc_base][spfFzWW2_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip4];
color=black@0.0:s=960x540:d=5[Ar2g1I2M_base];
[4:v]scale=200:150,format=rgba,colorchannelmixer=aa=1[wEhj4ZIv_clip];
[Ar2g1I2M_base][wEhj4ZIv_clip]overlay=25:25:format=auto,rotate=0,fps=30[clip5];
color=black@0.0:s=960x540:d=5[Ecvf0yOv_base];
[5:v]scale=960:540,format=rgba,colorchannelmixer=aa=1[iad4HuOC_clip];
[Ecvf0yOv_base][iad4HuOC_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip6];
color=black@0.0:s=960x540:d=5[gOfpY7XW_base];
[6:v]scale=960:540,format=rgba,colorchannelmixer=aa=1[qjEN3g99_clip];
[gOfpY7XW_base][qjEN3g99_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip7];
color=black@0.0:s=960x540:d=5[17lEXt3K_base];
[7:v]scale=960:540,format=rgba,colorchannelmixer=aa=1[odlxCsoL_clip];
[17lEXt3K_base][odlxCsoL_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip8];
color=c=black@0.0:s=960x540:d=0.5[void_clip1];
[void_clip1]fps=30[fps_void_clip1_jjyoOXgW];
[clip1]fps=30[fps_clip1_yiL424tl];
[fps_void_clip1_jjyoOXgW][fps_clip1_yiL424tl]xfade=transition=smoothup:duration=0.43333333333333335:offset=0,fps=30[start_xfade_oSDyWObM];
color=c=black@0.0:s=960x540:d=0.5[void_start_xfade_oSDyWObM];
[start_xfade_oSDyWObM]fps=30[fps_start_xfade_oSDyWObM_sjU1Hhls];
[void_start_xfade_oSDyWObM]fps=30[fps_void_start_xfade_oSDyWObM_QiZ7f9uk];
[fps_start_xfade_oSDyWObM_sjU1Hhls][fps_void_start_xfade_oSDyWObM_QiZ7f9uk]xfade=transition=smoothdown:duration=0.43333333333333335:offset=1.5,fps=30[end_xfade_bCeX1Nys];
color=c=black@0.0:s=960x540:d=0.5[void_clip2];
[void_clip2]fps=30[fps_void_clip2_YG5e2ZWt];
[clip2]fps=30[fps_clip2_bLAFy9ZZ];
[fps_void_clip2_YG5e2ZWt][fps_clip2_bLAFy9ZZ]xfade=transition=fade:duration=0.43333333333333335:offset=0,fps=30[start_xfade_M9z4V4Xh];
color=c=black@0.0:s=960x540:d=0.5[void_start_xfade_M9z4V4Xh];
[start_xfade_M9z4V4Xh]fps=30[fps_start_xfade_M9z4V4Xh_i7bFIbVt];
[void_start_xfade_M9z4V4Xh]fps=30[fps_void_start_xfade_M9z4V4Xh_1hx6OfWw];
[fps_start_xfade_M9z4V4Xh_i7bFIbVt][fps_void_start_xfade_M9z4V4Xh_1hx6OfWw]xfade=transition=circlecrop:duration=0.43333333333333335:offset=0.5,fps=30[end_xfade_RMyHWtJr];
color=c=black@0.0:s=960x540:d=0.5[void_clip3];
[clip3]fps=30[fps_clip3_4BbcWkl7];
[void_clip3]fps=30[fps_void_clip3_iV8E3fD2];
[fps_clip3_4BbcWkl7][fps_void_clip3_iV8E3fD2]xfade=transition=squeezev:duration=0.43333333333333335:offset=4.5,fps=30[end_xfade_OpGTlGMw];
color=c=black@0.0:s=960x540:d=0.5[void_clip8];
[clip8]fps=30[fps_clip8_fwYKSFw2];
[void_clip8]fps=30[fps_void_clip8_YN1NzqQH];
[fps_clip8_fwYKSFw2][fps_void_clip8_YN1NzqQH]xfade=transition=smoothdown:duration=0.43333333333333335:offset=4.5,fps=30[end_xfade_WB9hbOWG];
[gap_vyacld9R][end_xfade_bCeX1Nys]concat=n=2:v=1:a=0,fps=30[between_concat_c9b2pc2Y];
[between_concat_c9b2pc2Y][end_xfade_RMyHWtJr]concat=n=2:v=1:a=0,fps=30[between_concat_BGo5FqWv];
[between_concat_BGo5FqWv][gap_bnT3dqMs]concat=n=2:v=1:a=0,fps=30[between_concat_ZE90L7S2];
[between_concat_ZE90L7S2][end_xfade_OpGTlGMw]concat=n=2:v=1:a=0,fps=30[between_concat_H37xSvf3];
[between_concat_H37xSvf3][clip4]concat=n=2:v=1:a=0,fps=30[between_concat_6UgjET7L];
[between_concat_6UgjET7L]fps=30[fps_between_concat_6UgjET7L_lWWy0mJT];
[clip5]fps=30[fps_clip5_FWFbKkQO];
[fps_between_concat_6UgjET7L_lWWy0mJT][fps_clip5_FWFbKkQO]xfade=transition=fade:duration=1:offset=19,fps=30[between_xfade_H1fMRckW];
[between_xfade_H1fMRckW]fps=30[fps_between_xfade_H1fMRckW_VQZFz8tI];
[clip6]fps=30[fps_clip6_wnSkpm2k];
[fps_between_xfade_H1fMRckW_VQZFz8tI][fps_clip6_wnSkpm2k]xfade=transition=smoothdown:duration=1:offset=23,fps=30[between_xfade_fc5NzgPr];
[between_xfade_fc5NzgPr][clip7]concat=n=2:v=1:a=0,fps=30[between_concat_yupbgEeT];
[between_concat_yupbgEeT][end_xfade_WB9hbOWG]concat=n=2:v=1:a=0,fps=30[track_with_some_videos];
color=black@0.0:s=960x540:d=30[EqdPmGkR_base];
[10:v]loop=loop=900:size=900,setpts=PTS-STARTPTS,fps=30,scale=150:75,format=rgba,colorchannelmixer=aa=1[ntVWJ6hB_clip];
[EqdPmGkR_base][ntVWJ6hB_clip]overlay=805:5:format=auto,rotate=0,fps=30[watermark_clip];
color=c=black@0.0:s=960x540:d=8[gap_mXN43FL4];
color=c=black@0.0:s=960x540:d=0.5[void_watermark_clip];
[watermark_clip]fps=30[fps_watermark_clip_OboAmsuF];
[void_watermark_clip]fps=30[fps_void_watermark_clip_h4jlI8k6];
[fps_watermark_clip_OboAmsuF][fps_void_watermark_clip_h4jlI8k6]xfade=transition=squeezeh:duration=0.43333333333333335:offset=29.5,fps=30[end_xfade_SaWAh50p];
[end_xfade_SaWAh50p][gap_mXN43FL4]concat=n=2:v=1:a=0,fps=30[track_with_watermark];
anullsrc=channel_layout=stereo:sample_rate=44100:d=5[gap_tGhFkuUe];
[8:a]atrim=0:10,asetpts=PTS-STARTPTS,volume=1[audio_clip1];
anullsrc=channel_layout=stereo:sample_rate=44100:d=5[gap_hOMNevjZ];
[9:a]atrim=0:15,asetpts=PTS-STARTPTS,volume=1[audio_clip2];
anullsrc=channel_layout=stereo:sample_rate=44100:d=3[gap_VgHEpmwz];
[gap_tGhFkuUe][audio_clip1][gap_hOMNevjZ][audio_clip2][gap_VgHEpmwz]concat=n=5:v=0:a=1[track2];
[base][track_with_some_videos]overlay=0:0[inTiRqSX_combined_track];
[inTiRqSX_combined_track][track_with_watermark]overlay=0:0[video_output];
[track2]volume=1[audio_output];" \
-map '[video_output]' -map '[audio_output]' -c:v libx264 -c:a aac -b:a 320k -r 30 -s 960x540 -ss 0 -t 38 -crf 23 -preset veryfast -pix_fmt yuv420p output.mp4
