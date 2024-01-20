# json-to-ffmpeg
Experimental JSON to FFmpeg command line tool for video editing. 
Because of JSON it's much easier to create and edit video timeline and it's much easier to integrate it with other tools.

[![npm version](https://img.shields.io/npm/v/json-to-ffmpeg)](https://img.shields.io/npm/v/json-to-ffmpeg)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

### Features
* Supports video, audio and image sources
* Clip transformation: scale, position, rotation, opacity
* Clip transitions from/to and cross-fade: fade, smoothup, smoothdown, circlecrop, squeezev, squeezeh and more
* For non-linear video editing with multiple tracks and clips
* Minimalistic JSON format
* No direct ffmpeg or node dependency required

## Usage

Install package:

```bash
npm install json-to-ffmpeg

# or 

yarn add json-to-ffmpeg

# or

pnpm add json-to-ffmpeg
```

Import and use it:

```javascript
import { parseSchema } from 'json-to-ffmpeg';

const ffmpegCommand = parseSchema(schema);
```

or if you need filter complex part only:

```javascript
const filter = parseSchema(schema, true);
```

## Example
Tool translates video description from JSON to complex FFmpeg command including all required preprocessing steps, filters and transitions.

![timeline](./img/timeline.png)

The timeline can be passed either as a JSON string or as a JS object.
For example this JSON represent the timeline shown above:

```json
{
  "version": 1,
  "inputs": {
    "source1": {
      "type": "video",
      "file": "samples/bee1920.mp4",
      "hasAudio": false,
      "hasVideo": true,
      "duration": 40
    },
    "source2": {
      "type": "video",
      "file": "samples/book1920.mp4",
      "hasAudio": false,
      "hasVideo": true,
      "duration": 13
    },
    "source3": {
      "type": "video",
      "file": "samples/cows1920.mp4",
      "hasAudio": true,
      "hasVideo": true,
      "duration": 15
    },
    "source4": {
      "type": "video",
      "file": "samples/flowers1920.mp4",
      "hasAudio": true,
      "hasVideo": true,
      "duration": 21
    },
    "audio1": {
      "type": "audio",
      "file": "samples/ever.mp3",
      "hasAudio": true,
      "hasVideo": false,
      "duration": 181
    },
    "audio2": {
      "type": "audio",
      "file": "samples/weekend.mp3",
      "hasAudio": true,
      "hasVideo": false,
      "duration": 208
    },
    "watermark": {
      "type": "image",
      "file": "samples/flower.png",
      "hasAudio": false,
      "hasVideo": true,
      "duration": 0
    }
  },
  "tracks": {
    "track_with_some_videos": {
      "type": "video",
      "clips": [
        {
          "name": "clip1",
          "source": "source1",
          "timelineTrackStart": 3,
          "duration": 2,
          "sourceStartOffset": 10,
          "clipType": "video",
          "transform": {
            "x": 0,
            "y": 0,
            "width": 1920,
            "height": 1080,
            "rotation": 0,
            "opacity": 1
          }
        },
        {
          "name": "clip2",
          "source": "source2",
          "timelineTrackStart": 5,
          "duration": 1,
          "sourceStartOffset": 5,
          "clipType": "video",
          "transform": {
            "x": 0,
            "y": 0,
            "width": 1920,
            "height": 1080,
            "rotation": 0,
            "opacity": 1
          }
        },
        {
          "name": "clip3",
          "source": "source3",
          "timelineTrackStart": 10,
          "duration": 5,
          "sourceStartOffset": 3,
          "clipType": "video",
          "transform": {
            "x": 480,
            "y": 270,
            "width": 960,
            "height": 540,
            "rotation": 45,
            "opacity": 0.5
          }
        },
        {
          "name": "clip4",
          "source": "source1",
          "timelineTrackStart": 15,
          "duration": 5,
          "sourceStartOffset": 27,
          "clipType": "video",
          "transform": {
            "x": 0,
            "y": 0,
            "width": 1920,
            "height": 1080,
            "rotation": 0,
            "opacity": 1
          }
        },
        {
          "name": "clip5",
          "source": "source2",
          "timelineTrackStart": 19,
          "duration": 5,
          "sourceStartOffset": 0,
          "clipType": "video",
          "transform": {
            "x": 50,
            "y": 50,
            "width": 400,
            "height": 300,
            "rotation": 0,
            "opacity": 1
          }
        },
        {
          "name": "clip6",
          "source": "source4",
          "timelineTrackStart": 23,
          "duration": 5,
          "sourceStartOffset": 15,
          "clipType": "video",
          "transform": {
            "x": 0,
            "y": 0,
            "width": 1920,
            "height": 1080,
            "rotation": 0,
            "opacity": 1
          }
        },
        {
          "name": "clip7",
          "source": "source3",
          "timelineTrackStart": 28,
          "duration": 5,
          "sourceStartOffset": 0,
          "clipType": "video",
          "transform": {
            "x": 0,
            "y": 0,
            "width": 1920,
            "height": 1080,
            "rotation": 0,
            "opacity": 1
          }
        },
        {
          "name": "clip8",
          "source": "source1",
          "timelineTrackStart": 33,
          "duration": 5,
          "sourceStartOffset": 0,
          "clipType": "video",
          "transform": {
            "x": 0,
            "y": 0,
            "width": 1920,
            "height": 1080,
            "rotation": 0,
            "opacity": 1
          }
        }
      ]
    },
    "track_with_watermark": {
      "type": "video",
      "clips": [
        {
          "name": "watermark_clip",
          "source": "watermark",
          "timelineTrackStart": 0,
          "duration": 30,
          "sourceStartOffset": 0,
          "clipType": "image",
          "transform": {
            "x": 1610,
            "y": 10,
            "width": 300,
            "height": 150,
            "rotation": 0,
            "opacity": 1
          }
        }
      ]
    },
    "track2": {
      "type": "audio",
      "clips": [
        {
          "name": "audio_clip1",
          "source": "audio1",
          "timelineTrackStart": 5,
          "duration": 10,
          "sourceStartOffset": 0,
          "clipType": "audio",
          "volume": 1
        },
        {
          "name": "audio_clip2",
          "source": "audio2",
          "timelineTrackStart": 20,
          "duration": 15,
          "sourceStartOffset": 0,
          "clipType": "audio",
          "volume": 1
        }
      ]
    }
  },
  "transitions": [
    {
      "type": "smoothup",
      "duration": 0.5,
      "from": null,
      "to": "clip1"
    },
    {
      "type": "smoothdown",
      "duration": 0.5,
      "from": "clip1",
      "to": null
    },
    {
      "type": "fade",
      "duration": 0.5,
      "from": null,
      "to": "clip2"
    },
    {
      "type": "circlecrop",
      "duration": 0.5,
      "from": "clip2",
      "to": null
    },
    {
      "type": "squeezev",
      "duration": 0.5,
      "from": "clip3",
      "to": null
    },
    {
      "type": "squeezeh",
      "duration": 0.5,
      "from": "watermark_clip",
      "to": null
    },
    {
      "type": "fade",
      "duration": 1,
      "from": "clip4",
      "to": "clip5"
    },
    {
      "type": "smoothdown",
      "duration": 1,
      "from": "clip5",
      "to": "clip6"
    },
    {
      "type": "smoothdown",
      "duration": 0.5,
      "from": "clip8",
      "to": null
    }
  ],
  "output": {
    "tempDir": "./tmp",
    "file": "output.mp4",
    "videoCodec": "libx264",
    "audioCodec": "aac",
    "width": 1920,
    "height": 1080,
    "audioBitrate": "320k",
    "preset": "veryfast",
    "crf": 23,
    "framerate": 30,
    "flags": [
      "-pix_fmt",
      "yuv420p"
    ],
    "startPosition": 0,
    "endPosition": 38,
    "scaleRatio": 0.2
  }
}
```

will be translated into command like this:

```bash
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
color=c=black@0.0:s=384x216:d=3[gap_xbPT0R2D];
color=black@0.0:s=384x216:d=2[cMu1AeAv_base];
[0:v]scale=384:216,format=rgba,colorchannelmixer=aa=1[Tqb8V30z_clip];
[cMu1AeAv_base][Tqb8V30z_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip1];
color=black@0.0:s=384x216:d=1[nwjCLeBf_base];
[1:v]scale=384:216,format=rgba,colorchannelmixer=aa=1[Jt2Ow3z7_clip];
[nwjCLeBf_base][Jt2Ow3z7_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip2];
color=c=black@0.0:s=384x216:d=4[gap_wGJMg2Xy];
color=black@0.0:s=384x216:d=5[nbl0GdNN_base];
[2:v]scale=192:108,format=rgba,colorchannelmixer=aa=0.5[fuMgQH1R_clip];
[nbl0GdNN_base][fuMgQH1R_clip]overlay=96:54:format=auto,rotate=45,fps=30[clip3];
color=black@0.0:s=384x216:d=5[KWL95Ced_base];
[3:v]scale=384:216,format=rgba,colorchannelmixer=aa=1[tiuMabCa_clip];
[KWL95Ced_base][tiuMabCa_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip4];
color=black@0.0:s=384x216:d=5[DYDR0Q6x_base];
[4:v]scale=80:60,format=rgba,colorchannelmixer=aa=1[52NAZxII_clip];
[DYDR0Q6x_base][52NAZxII_clip]overlay=10:10:format=auto,rotate=0,fps=30[clip5];
color=black@0.0:s=384x216:d=5[nG4pXmLO_base];
[5:v]scale=384:216,format=rgba,colorchannelmixer=aa=1[CgOJcTIJ_clip];
[nG4pXmLO_base][CgOJcTIJ_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip6];
color=black@0.0:s=384x216:d=5[occJwxJK_base];
[6:v]scale=384:216,format=rgba,colorchannelmixer=aa=1[varB8t9b_clip];
[occJwxJK_base][varB8t9b_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip7];
color=black@0.0:s=384x216:d=5[3q2VQ9Fn_base];
[7:v]scale=384:216,format=rgba,colorchannelmixer=aa=1[TnMfX5QP_clip];
[3q2VQ9Fn_base][TnMfX5QP_clip]overlay=0:0:format=auto,rotate=0,fps=30[clip8];
color=c=black@0.0:s=384x216:d=0.5[void_clip1];
[void_clip1]fps=30[fps_void_clip1_cpX1K4oW];
[clip1]fps=30[fps_clip1_9yaTMQSH];
[fps_void_clip1_cpX1K4oW][fps_clip1_9yaTMQSH]xfade=transition=smoothup:duration=0.43333333333333335:offset=0,fps=30[start_xfade_wvuFc7bn];
color=c=black@0.0:s=384x216:d=0.5[void_start_xfade_wvuFc7bn];
[start_xfade_wvuFc7bn]fps=30[fps_start_xfade_wvuFc7bn_XxZrJa0B];
[void_start_xfade_wvuFc7bn]fps=30[fps_void_start_xfade_wvuFc7bn_hwY2KZxJ];
[fps_start_xfade_wvuFc7bn_XxZrJa0B][fps_void_start_xfade_wvuFc7bn_hwY2KZxJ]xfade=transition=smoothdown:duration=0.43333333333333335:offset=1.5,fps=30[end_xfade_6MnYQ2ds];
color=c=black@0.0:s=384x216:d=0.5[void_clip2];
[void_clip2]fps=30[fps_void_clip2_vSBFpXYV];
[clip2]fps=30[fps_clip2_j3pJwJ6G];
[fps_void_clip2_vSBFpXYV][fps_clip2_j3pJwJ6G]xfade=transition=fade:duration=0.43333333333333335:offset=0,fps=30[start_xfade_gCAkUPK2];
color=c=black@0.0:s=384x216:d=0.5[void_start_xfade_gCAkUPK2];
[start_xfade_gCAkUPK2]fps=30[fps_start_xfade_gCAkUPK2_ZnLBlAtD];
[void_start_xfade_gCAkUPK2]fps=30[fps_void_start_xfade_gCAkUPK2_mLqar0Ah];
[fps_start_xfade_gCAkUPK2_ZnLBlAtD][fps_void_start_xfade_gCAkUPK2_mLqar0Ah]xfade=transition=circlecrop:duration=0.43333333333333335:offset=0.5,fps=30[end_xfade_aKd3UWQt];
color=c=black@0.0:s=384x216:d=0.5[void_clip3];
[clip3]fps=30[fps_clip3_3Ga4ugVG];
[void_clip3]fps=30[fps_void_clip3_5aVt3xnR];
[fps_clip3_3Ga4ugVG][fps_void_clip3_5aVt3xnR]xfade=transition=squeezev:duration=0.43333333333333335:offset=4.5,fps=30[end_xfade_s7Ol6uli];
color=c=black@0.0:s=384x216:d=0.5[void_clip8];
[clip8]fps=30[fps_clip8_4ZkGxZrd];
[void_clip8]fps=30[fps_void_clip8_ylXk9DHa];
[fps_clip8_4ZkGxZrd][fps_void_clip8_ylXk9DHa]xfade=transition=smoothdown:duration=0.43333333333333335:offset=4.5,fps=30[end_xfade_xAKXZo2d];
[gap_xbPT0R2D][end_xfade_6MnYQ2ds]concat=n=2:v=1:a=0,fps=30[between_concat_xlCW8OEt];
[between_concat_xlCW8OEt][end_xfade_aKd3UWQt]concat=n=2:v=1:a=0,fps=30[between_concat_FQfoDU4F];
[between_concat_FQfoDU4F][gap_wGJMg2Xy]concat=n=2:v=1:a=0,fps=30[between_concat_TVD5hCH9];
[between_concat_TVD5hCH9][end_xfade_s7Ol6uli]concat=n=2:v=1:a=0,fps=30[between_concat_xTjAkdon];
[between_concat_xTjAkdon][clip4]concat=n=2:v=1:a=0,fps=30[between_concat_m0OYCgp8];
[between_concat_m0OYCgp8]fps=30[fps_between_concat_m0OYCgp8_noaEdyvP];
[clip5]fps=30[fps_clip5_kQ745of1];
[fps_between_concat_m0OYCgp8_noaEdyvP][fps_clip5_kQ745of1]xfade=transition=fade:duration=1:offset=19,fps=30[between_xfade_HVZF1EvG];
[between_xfade_HVZF1EvG]fps=30[fps_between_xfade_HVZF1EvG_YWChbdii];
[clip6]fps=30[fps_clip6_6MbjfU2H];
[fps_between_xfade_HVZF1EvG_YWChbdii][fps_clip6_6MbjfU2H]xfade=transition=smoothdown:duration=1:offset=23,fps=30[between_xfade_3RlWNvho];
[between_xfade_3RlWNvho][clip7]concat=n=2:v=1:a=0,fps=30[between_concat_OxLtEhr7];
[between_concat_OxLtEhr7][end_xfade_xAKXZo2d]concat=n=2:v=1:a=0,fps=30[track_with_some_videos];
color=black@0.0:s=384x216:d=30[CYKVVqgc_base];
[10:v]loop=loop=900:size=900,setpts=PTS-STARTPTS,fps=30,scale=60:30,format=rgba,colorchannelmixer=aa=1[VvcI98fO_clip];
[CYKVVqgc_base][VvcI98fO_clip]overlay=322:2:format=auto,rotate=0,fps=30[watermark_clip];
color=c=black@0.0:s=384x216:d=8[gap_eOcpsLfb];
color=c=black@0.0:s=384x216:d=0.5[void_watermark_clip];
[watermark_clip]fps=30[fps_watermark_clip_fRSzmFrO];
[void_watermark_clip]fps=30[fps_void_watermark_clip_fhdBGNa7];
[fps_watermark_clip_fRSzmFrO][fps_void_watermark_clip_fhdBGNa7]xfade=transition=squeezeh:duration=0.43333333333333335:offset=29.5,fps=30[end_xfade_imi5OETb];
[end_xfade_imi5OETb][gap_eOcpsLfb]concat=n=2:v=1:a=0,fps=30[track_with_watermark];
anullsrc=channel_layout=stereo:sample_rate=44100:d=5[gap_9ROKhKdt];
[8:a]atrim=0:10,asetpts=PTS-STARTPTS,volume=1[audio_clip1];
anullsrc=channel_layout=stereo:sample_rate=44100:d=5[gap_fV2D5e8A];
[9:a]atrim=0:15,asetpts=PTS-STARTPTS,volume=1[audio_clip2];
anullsrc=channel_layout=stereo:sample_rate=44100:d=3[gap_4fwsUHt5];
[gap_9ROKhKdt][audio_clip1][gap_fV2D5e8A][audio_clip2][gap_4fwsUHt5]concat=n=5:v=0:a=1[track2];
[base][track_with_some_videos]overlay=0:0[gE0LAoGU_combined_track];
[gE0LAoGU_combined_track][track_with_watermark]overlay=0:0[video_output];
[track2]volume=1[audio_output];" \
-map '[video_output]' -map '[audio_output]' -c:v libx264 -c:a aac -b:a 320k -r 30 -s 384x216 -ss 0 -t 38 -crf 23 -preset veryfast -pix_fmt yuv420p output.mp4
```

## Video, audio and image test samples
All samples are from [Pixabay](https://pixabay.com/). All samples are licensed under [Pixabay License](https://pixabay.com/service/license/).

* https://pixabay.com/videos/cow-ruminant-pasture-meadow-nature-186195/
* https://pixabay.com/videos/book-pages-literature-beach-ocean-185096/
* https://pixabay.com/videos/flower-peony-bee-insect-pollinate-165065/
* https://pixabay.com/videos/kangaroos-marsupials-mammal-181314/
* https://pixabay.com/videos/flower-dandelion-wild-flowers-72763/
* https://pixabay.com/videos/highland-cows-cows-cattle-scotland-65903/
* https://pixabay.com/videos/robin-bird-forest-nature-spring-21723/
* https://pixabay.com/music/beats-weeknds-122592/
* https://pixabay.com/music/future-bass-ever-flowing-12277/

## License
MIT