function throttle<Args extends unknown[]>(
  fn: (...args: Args) => void,
  intervalMs: number,
): (...args: Args) => void {
  let lastCall = 0;
  return (...args: Args): void => {
    const now = Date.now();
    if (now - lastCall >= intervalMs) {
      lastCall = now;
      fn(...args);
    }
  };
}

const logScroll = throttle((position: number) => {
  console.log(`scroll position: ${position}`);
}, 100);

logScroll(10);
logScroll(20);
logScroll(30);
