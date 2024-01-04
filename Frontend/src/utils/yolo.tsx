export const bboxCoordsToCanvasCoords = (
  canvas: HTMLCanvasElement,
  bbox: number[]
) => {
  const canvasWidth = canvas.width;
  const canvasHeight = canvas.height;
  // const dX = canvas.clientWidth / weaponDetection.orig_shape[0];
  // const dY = canvas.clientHeight / weaponDetection.orig_shape[1];

  const [normalisedMidX, normalisedMidY, normalisedWidth, normalisedHeight] =
    bbox;
  const midX = normalisedMidX * canvasWidth;
  const midY = normalisedMidY * canvasHeight;

  const width = normalisedWidth * canvasWidth;
  const height = normalisedHeight * canvasHeight;
  const x = midX - width / 2;
  const y = midY - height / 2;

  return { x, y, width, height };
};
