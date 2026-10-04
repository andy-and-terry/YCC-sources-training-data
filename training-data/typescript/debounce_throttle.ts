export function debounce<A extends unknown[]>(fn: (...args: A) => void, waitMs: number) {
  let timer: ReturnType<typeof setTimeout> | undefined;
  return (...args: A): void => {
    if (timer !== undefined) clearTimeout(timer);
    timer = setTimeout(() => fn(...args), waitMs);
  };
}

export function throttle<A extends unknown[]>(fn: (...args: A) => void, intervalMs: number) {
  let last = -Infinity;
  return (...args: A): void => {
    const now = Date.now();
    if (now - last >= intervalMs) {
      last = now;
      fn(...args);
    }
  };
}

const log = debounce((msg: string) => console.log("debounced:", msg), 20);
log("a");
log("b");
log("c");

const tick = throttle((n: number) => console.log("throttled:", n), 50);
for (let i = 0; i < 5; i++) tick(i);
