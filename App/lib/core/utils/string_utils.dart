String addEllipsis(String input, int threshold) {
  if (input.length > threshold) {
    return input.substring(0, threshold) + '...';
  } else {
    return input;
  }
}
