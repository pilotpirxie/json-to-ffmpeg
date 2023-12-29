import { VideoEditorFormat } from "./types/VideoEditingFormat";

export class JsonToFFmpeg {
  schema: VideoEditorFormat;

  constructor(schema: VideoEditorFormat) {
    this.schema = schema;
  }

  private parseInputs(): string {
    let inputs = "";

    for (const [key, value] of Object.entries(this.schema.inputs)) {
      inputs += `-i ${value.file} `;
    }

    return inputs;
  }

  private parseTracks(): string {
    let tracks = "";

    for (const [key, value] of Object.entries(this.schema.tracks)) {
      tracks += this.parseClips(value.clips);
    }

    return tracks;
  }

  private parseClips(clips: any[]): string {
    let parsedClips = "";

    for (const clip of clips) {
      parsedClips += this.parseClip(clip);
    }

    return parsedClips;
  }

  private parseClip(clip: any): string {
    switch (clip.clipType) {
      case "video":
        return this.parseVideoClip(clip);
      case "audio":
        return this.parseAudioClip(clip);
      case "image":
        return this.parseImageClip(clip);
      default:
        throw new Error(`Unknown clip type: ${clip.clipType}`);
    }
  }

  private parseVideoClip(clip: any): string {
    let parsedClip = `-ss ${clip.start} -t ${clip.duration} -i ${clip.source} `;
    parsedClip += this.parseTransform(clip.transform);
    parsedClip += this.parseTransitions(clip.transitions);
    return parsedClip;
  }

  private parseAudioClip(clip: any): string {
    return `-ss ${clip.start} -t ${clip.duration} -i ${clip.source} `;
  }

  private parseImageClip(clip: any): string {
    let parsedClip = `-loop 1 -t ${clip.duration} -i ${clip.source} `;
    parsedClip += this.parseTransform(clip.transform);
    return parsedClip;
  }

  private parseTransform(transform: any): string {
    let parsedTransform = "";
    if (transform) {
      parsedTransform += `-vf scale=${transform.width}:${transform.height} `;
    }
    return parsedTransform;
  }

  private parseTransitions(transitions: any[]): string {
    let parsedTransitions = "";
    for (const transition of transitions) {
      parsedTransitions += this.parseTransition(transition);
    }
    return parsedTransitions;
  }

  private parseTransition(transition: any): string {
    let parsedTransition = "";
    switch (transition.type) {
      case "fade":
        parsedTransition += `-filter_complex "[0:v]fade=out:${transition.position}:30[t];[1:v]fade=in:${transition.position}:30[bt];[bt][t]overlay" `;
        break;
      default:
        throw new Error(`Unknown transition type: ${transition.type}`);
    }
    return parsedTransition;
  }

  private parseOutput(): string {
    const {
      file,
      bitrate,
      format,
      framerate,
      videoCodec,
      audioCodec,
      resolution,
    } = this.schema.output;

    return `-c:v ${videoCodec} -c:a ${audioCodec} -b:v ${bitrate} -r ${framerate} -s ${resolution} ${file}`;
  }
}
