import { VideoClip } from "./types/Clip";
import { Inputs } from "./types/Inputs";
import { findInputIndex } from "./utils/findInputIndex";
import { findInput } from "./utils/findInput";
import { Output } from "./types/Output";

export function parseVideoClip({
  clip,
  inputs,
  output,
}: {
  clip: VideoClip;
  inputs: Inputs;
  output: Output;
}): string {
  const { duration, sourceStartOffset, source, transform, name } = clip;
  const { width, height, rotation, opacity, y, x } = transform;

  const inputIndex = findInputIndex(inputs, source);
  const input = findInput(inputs, source);
  const { hasVideo } = input;

  let filters: string[] = [];

  if (hasVideo) {
    filters.push(`trim=${sourceStartOffset}:${sourceStartOffset + duration}`);
    filters.push(`setpts=PTS-STARTPTS`);
    filters.push(`scale=${width}:${height}`);
    filters.push(`format=rgba,colorchannelmixer=aa=${opacity}`);
  }

  let postOverlayFilters: string[] = [];
  if (hasVideo) {
    postOverlayFilters.push(`rotate=${rotation}`);
  }

  let clipCommand = `color=black@0.0:s=${output.width}x${output.height}:d=${clip.duration}[${name}_base];\n`;
  clipCommand += `[${inputIndex}:v]${filters.join(",")}[${name}_clip];\n`;
  clipCommand += `[${name}_base][${name}_clip]overlay=${x}:${y}:format=auto,${postOverlayFilters.join(
    ",",
  )}[${name}];`;

  return clipCommand;
}
