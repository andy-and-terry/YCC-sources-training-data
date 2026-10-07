function debounce<Args extends unknown[]>(
  fn: (...args: Args) => void,
  delayMs: number,
): (...args: Args) => void {
  let timer: ReturnType<typeof setTimeout> | undefined;
  return (...args: Args): void => {
    if (timer !== undefined) clearTimeout(timer);
    timer = setTimeout(() => fn(...args), delayMs);
  };
}

const logResize = debounce((width: number, height: number) => {
  console.log(`resized to ${width}x${height}`);
}, 200);

logResize(100, 200);
logResize(150, 250);
logResize(300, 400);
