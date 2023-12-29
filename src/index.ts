import { VideoEditorFormat } from "./types/VideoEditingFormat";
import { AudioClip, Clip, ImageClip, VideoClip } from "./types/Clip";
import { Track, Tracks } from "./types/Tracks";
import { Inputs, Source } from "./types/Inputs";
import { Output } from "./types/Output";

// const jsonToFFmpeg = new JsonToFFmpeg({
//   inputs: {
//     source1: {
//       type: "video",
//       file: "video1.mp4",
//       hasAudio: false,
//       hasVideo: true,
//       duration: 300,
//     },
//     source2: {
//       type: "video",
//       file: "video2.mp4",
//       hasAudio: false,
//       hasVideo: true,
//       duration: 75,
//     },
//     source3: {
//       type: "video",
//       file: "video3.mp4",
//       hasAudio: true,
//       hasVideo: true,
//       duration: 1145,
//     },
//     source4: {
//       type: "video",
//       file: "video4.mp4",
//       hasAudio: true,
//       hasVideo: true,
//       duration: 319,
//     },
//     audio1: {
//       type: "audio",
//       file: "audio1.mp3",
//       hasAudio: true,
//       hasVideo: false,
//       duration: 191,
//     },
//     audio2: {
//       type: "audio",
//       file: "audio2.mp3",
//       hasAudio: true,
//       hasVideo: false,
//       duration: 410,
//     },
//     watermark: {
//       type: "image",
//       file: "watermark.png",
//       hasAudio: false,
//       hasVideo: true,
//       duration: 0,
//     },
//   },
//   tracks: {
//     track0: {
//       type: "video",
//       clips: [
//         {
//           name: "watermark_clip",
//           source: "watermark",
//           timelineTrackStart: 0,
//           duration: 60,
//           sourceStartOffset: 0,
//           clipType: "image",
//           transform: {
//             x: 1610,
//             y: 10,
//             width: 300,
//             height: 150,
//             rotation: 0,
//             opacity: 1,
//           },
//         },
//       ],
//     },
//     track1: {
//       type: "video",
//       clips: [
//         {
//           name: "clip1",
//           source: "source1",
//           timelineTrackStart: 0,
//           duration: 5,
//           sourceStartOffset: 10,
//           clipType: "video",
//           transform: {
//             x: 0,
//             y: 0,
//             width: 1920,
//             height: 1080,
//             rotation: 0,
//             opacity: 1,
//           },
//           transitions: [],
//         },
//         {
//           name: "clip2",
//           source: "source1",
//           timelineTrackStart: 5,
//           duration: 5,
//           sourceStartOffset: 30,
//           clipType: "video",
//           transform: {
//             x: 0,
//             y: 0,
//             width: 1920,
//             height: 1080,
//             rotation: 0,
//             opacity: 1,
//           },
//           transitions: [],
//         },
//         {
//           name: "clip3",
//           source: "source3",
//           timelineTrackStart: 10,
//           duration: 5,
//           sourceStartOffset: 3,
//           clipType: "video",
//           transform: {
//             x: 0,
//             y: 0,
//             width: 1920,
//             height: 1080,
//             rotation: 0,
//             opacity: 1,
//           },
//           transitions: [],
//         },
//         {
//           name: "clip4",
//           source: "source1",
//           timelineTrackStart: 15,
//           duration: 5,
//           sourceStartOffset: 27,
//           clipType: "video",
//           transform: {
//             x: 0,
//             y: 0,
//             width: 1920,
//             height: 1080,
//             rotation: 0,
//             opacity: 1,
//           },
//           transitions: [],
//         },
//         {
//           name: "clip5",
//           source: "source2",
//           timelineTrackStart: 20,
//           duration: 5,
//           sourceStartOffset: 0,
//           clipType: "video",
//           transform: {
//             x: 0,
//             y: 0,
//             width: 1920,
//             height: 1080,
//             rotation: 0,
//             opacity: 1,
//           },
//           transitions: [],
//         },
//         {
//           name: "clip6",
//           source: "source4",
//           timelineTrackStart: 25,
//           duration: 5,
//           sourceStartOffset: 15,
//           clipType: "video",
//           transform: {
//             x: 0,
//             y: 0,
//             width: 1920,
//             height: 1080,
//             rotation: 0,
//             opacity: 1,
//           },
//           transitions: [],
//         },
//         {
//           name: "clip7",
//           source: "source4",
//           timelineTrackStart: 30,
//           duration: 5,
//           sourceStartOffset: 0,
//           clipType: "video",
//           transform: {
//             x: 0,
//             y: 0,
//             width: 1920,
//             height: 1080,
//             rotation: 0,
//             opacity: 1,
//           },
//           transitions: [],
//         },
//         {
//           name: "clip8",
//           source: "source4",
//           timelineTrackStart: 35,
//           duration: 5,
//           sourceStartOffset: 10,
//           clipType: "video",
//           transform: {
//             x: 0,
//             y: 0,
//             width: 1920,
//             height: 1080,
//             rotation: 0,
//             opacity: 1,
//           },
//           transitions: [],
//         },
//       ],
//     },
//     track2: {
//       type: "audio",
//       clips: [
//         {
//           name: "audio_clip1",
//           source: "audio1",
//           timelineTrackStart: 0,
//           duration: 50,
//           sourceStartOffset: 0,
//           clipType: "audio",
//           volume: 1,
//         },
//         {
//           name: "audio_clip2",
//           source: "audio2",
//           timelineTrackStart: 0,
//           duration: 40,
//           sourceStartOffset: 0,
//           clipType: "audio",
//           volume: 1,
//         },
//       ],
//     },
//   },
//   output: {
//     file: "output.mp4",
//     format: "mp4",
//     videoCodec: "libx264",
//     audioCodec: "aac",
//     resolution: "1920x1080",
//     bitrate: "5000k",
//     framerate: 30,
//   },
// });

export class JsonToFFmpeg {
  schema: VideoEditorFormat;

  constructor(schema: VideoEditorFormat) {
    this.schema = schema;
  }

  private findInputIndex(inputName: string): number {
    const inputNames = Object.keys(this.schema.inputs);
    return inputNames.indexOf(inputName);
  }

  private findInput(inputName: string): Source {
    return this.schema.inputs[inputName];
  }

  private parseInputs(inputs: Inputs): string {
    let inputsCommand = "";

    for (const [key, value] of Object.entries(this.schema.inputs)) {
      inputsCommand += `-i ${value.file}\n`;
    }

    return inputsCommand;
  }

  private parseTracks(tracks: Tracks): string {
    let tracksCommand = "";

    for (const [trackName, track] of Object.entries(this.schema.tracks)) {
      tracksCommand += this.parseTrack(trackName, track);
    }

    // concatenate all video tracks into one
    // and all audio tracks into one
    // keeping in mind position of each track
    // and overlaying them on top of each other if necessary
    // then output the final track "video_output" and "audio_output"

    return tracksCommand + "\n";
  }

  private parseTrack(trackName: string, track: Track): string {
    let clips = "";

    for (const clip of track.clips) {
      clips += this.parseClip(clip);
    }

    for (const clip of track.clips) {
      clips += `[${clip.name}]`;
    }

    clips += `concat=n=${track.clips.length}:v=1:a=1[${trackName}];\n`;

    return clips;
  }

  private parseClip(clip: Clip): string {
    let clipString = "";

    if (clip.clipType === "video") {
      clipString += this.parseVideoClip(clip);
    } else if (clip.clipType === "audio") {
      clipString += this.parseAudioClip(clip);
    } else if (clip.clipType === "image") {
      clipString += this.parseImageClip(clip);
    }

    return clipString + "\n";
  }

  private parseVideoClip(clip: VideoClip): string {
    const { duration, sourceStartOffset, source, transform, name } = clip;
    const { width, height, rotation, opacity } = transform;

    const inputIndex = this.findInputIndex(source);
    const input = this.findInput(source);
    const { hasVideo } = input;

    let filters: string[] = [];

    if (hasVideo) {
      filters.push(`trim=${sourceStartOffset}:${duration}`);
      filters.push(`setpts=PTS-STARTPTS`);
      filters.push(`scale=${width}:${height}`);
      filters.push(`rotate=${rotation}`);
      filters.push(`colorchannelmixer=aa=${opacity}`);
      // filters.push(`overlay=${x}:${y}`);
    }

    return `[${inputIndex}:v]${filters.join(",")}[${name}];`;
  }

  private parseAudioClip(clip: AudioClip): string {
    const { duration, sourceStartOffset, source, volume, name } = clip;

    const inputIndex = this.findInputIndex(source);
    const input = this.findInput(source);
    const { hasAudio } = input;

    let filters: string[] = [];

    if (hasAudio) {
      filters.push(`atrim=${sourceStartOffset}:${duration}`);
      filters.push(`asetpts=PTS-STARTPTS`);
      filters.push(`volume=${volume}`);
    }

    return `[${inputIndex}:a]${filters.join(",")}[${name}];`;
  }

  private parseImageClip(clip: ImageClip): string {
    const { name, duration, source, transform } = clip;
    const { width, height, rotation, opacity } = transform;

    const inputIndex = this.findInputIndex(source);
    const input = this.findInput(source);
    const { hasVideo } = input;

    let filters: string[] = [];

    if (hasVideo) {
      filters.push(`loop=loop=-1:size=${duration}`);
      filters.push(`setpts=PTS-STARTPTS`);
      filters.push(`scale=${width}:${height}`);
      filters.push(`rotate=${rotation}`);
      filters.push(`colorchannelmixer=aa=${opacity}`);
      // filters.push(`overlay=${x}:${y}`);
    }

    return `[${inputIndex}:v]${filters.join(",")}[${name}];`;
  }

  private parseOutput(output: Output): string {
    let outputCommand = "";

    const {
      file,
      bitrate,
      format,
      framerate,
      videoCodec,
      audioCodec,
      resolution,
    } = this.schema.output;

    outputCommand += `-map [video_output] -map [audio_output] -c:v ${videoCodec} -c:a ${audioCodec} -b:v ${bitrate} -r ${framerate} -s ${resolution} ${file}`;

    return outputCommand;
  }

  public parse(): string {
    let outputCommand = "ffmpeg ";

    outputCommand += this.parseInputs(this.schema.inputs);
    outputCommand += this.parseTracks(this.schema.tracks);
    outputCommand += this.parseOutput(this.schema.output);

    return outputCommand;
  }
}
