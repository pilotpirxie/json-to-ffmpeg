import { JsonToFFmpeg } from "../../src";

(async () => {
  const jsonToFFmpeg = new JsonToFFmpeg({
    inputs: {
      source1: {
        type: "video",
        file: "video1.mp4",
        hasAudio: false,
        hasVideo: true,
        duration: 300,
      },
      source2: {
        type: "video",
        file: "video2.mp4",
        hasAudio: false,
        hasVideo: true,
        duration: 75,
      },
      source3: {
        type: "video",
        file: "video3.mp4",
        hasAudio: true,
        hasVideo: true,
        duration: 1145,
      },
      source4: {
        type: "video",
        file: "video4.mp4",
        hasAudio: true,
        hasVideo: true,
        duration: 319,
      },
      audio1: {
        type: "audio",
        file: "audio1.mp3",
        hasAudio: true,
        hasVideo: false,
        duration: 191,
      },
      audio2: {
        type: "audio",
        file: "audio2.mp3",
        hasAudio: true,
        hasVideo: false,
        duration: 410,
      },
      watermark: {
        type: "image",
        file: "watermark.png",
        hasAudio: false,
        hasVideo: true,
        duration: 0,
      },
    },
    tracks: {
      track0: {
        type: "video",
        clips: [
          {
            name: "watermark_clip",
            source: "watermark",
            timelineTrackStart: 0,
            duration: 60,
            sourceStartOffset: 0,
            clipType: "image",
            transform: {
              x: 1610,
              y: 10,
              width: 300,
              height: 150,
              rotation: 0,
              opacity: 1,
            },
          },
        ],
      },
      track1: {
        type: "video",
        clips: [
          {
            name: "clip1",
            source: "source1",
            timelineTrackStart: 0,
            duration: 5,
            sourceStartOffset: 10,
            clipType: "video",
            transform: {
              x: 0,
              y: 0,
              width: 1920,
              height: 1080,
              rotation: 0,
              opacity: 1,
            },
            transitions: [],
          },
          {
            name: "clip2",
            source: "source1",
            timelineTrackStart: 5,
            duration: 5,
            sourceStartOffset: 30,
            clipType: "video",
            transform: {
              x: 0,
              y: 0,
              width: 1920,
              height: 1080,
              rotation: 0,
              opacity: 1,
            },
            transitions: [],
          },
          {
            name: "clip3",
            source: "source3",
            timelineTrackStart: 10,
            duration: 5,
            sourceStartOffset: 3,
            clipType: "video",
            transform: {
              x: 0,
              y: 0,
              width: 1920,
              height: 1080,
              rotation: 0,
              opacity: 1,
            },
            transitions: [],
          },
          {
            name: "clip4",
            source: "source1",
            timelineTrackStart: 15,
            duration: 5,
            sourceStartOffset: 27,
            clipType: "video",
            transform: {
              x: 0,
              y: 0,
              width: 1920,
              height: 1080,
              rotation: 0,
              opacity: 1,
            },
            transitions: [],
          },
          {
            name: "clip5",
            source: "source2",
            timelineTrackStart: 20,
            duration: 5,
            sourceStartOffset: 0,
            clipType: "video",
            transform: {
              x: 0,
              y: 0,
              width: 1920,
              height: 1080,
              rotation: 0,
              opacity: 1,
            },
            transitions: [],
          },
          {
            name: "clip6",
            source: "source4",
            timelineTrackStart: 25,
            duration: 5,
            sourceStartOffset: 15,
            clipType: "video",
            transform: {
              x: 0,
              y: 0,
              width: 1920,
              height: 1080,
              rotation: 0,
              opacity: 1,
            },
            transitions: [],
          },
          {
            name: "clip7",
            source: "source4",
            timelineTrackStart: 30,
            duration: 5,
            sourceStartOffset: 0,
            clipType: "video",
            transform: {
              x: 0,
              y: 0,
              width: 1920,
              height: 1080,
              rotation: 0,
              opacity: 1,
            },
            transitions: [],
          },
          {
            name: "clip8",
            source: "source4",
            timelineTrackStart: 35,
            duration: 5,
            sourceStartOffset: 10,
            clipType: "video",
            transform: {
              x: 0,
              y: 0,
              width: 1920,
              height: 1080,
              rotation: 0,
              opacity: 1,
            },
            transitions: [],
          },
        ],
      },
      track2: {
        type: "audio",
        clips: [
          {
            name: "audio_clip1",
            source: "audio1",
            timelineTrackStart: 0,
            duration: 50,
            sourceStartOffset: 0,
            clipType: "audio",
            volume: 1,
          },
          {
            name: "audio_clip2",
            source: "audio2",
            timelineTrackStart: 0,
            duration: 40,
            sourceStartOffset: 0,
            clipType: "audio",
            volume: 1,
          },
        ],
      },
    },
    output: {
      file: "output.mp4",
      format: "mp4",
      videoCodec: "libx264",
      audioCodec: "aac",
      resolution: "1920x1080",
      bitrate: "5000k",
      framerate: 30,
    },
  });

  const ffmpegCommand = jsonToFFmpeg.parse();

  console.log(ffmpegCommand);
})();