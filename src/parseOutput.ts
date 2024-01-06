import { VideoEditorFormat } from "./types/VideoEditingFormat";

/**
 * Parse output schema object and return command
 * with flags and arguments configured in options.
 * @param schema
 */
export function parseOutput({ schema }: { schema: VideoEditorFormat }): string {
  let outputCommand = "";

  const {
    file,
    framerate,
    videoCodec,
    audioCodec,
    width,
    height,
    flags,
    audioBitrate,
    crf,
    preset,
    startPosition,
    endPosition,
    scaleRatio,
  } = schema.output;
  const additionalFlags = flags.length > 0 ? flags.join(" ") : "";

  const renderWidth = Math.round(width * scaleRatio);
  const renderHeight = Math.round(height * scaleRatio);
  const resolution = `${renderWidth}x${renderHeight}`;

  outputCommand += `-map '[video_output]' -map '[audio_output]' -c:v ${videoCodec} -c:a ${audioCodec} -b:a ${audioBitrate} -r ${framerate} -s ${resolution} -ss ${startPosition} -t ${
    endPosition - startPosition
  } -crf ${crf} -preset ${preset} ${additionalFlags} ${file}`;

  return outputCommand;
}
