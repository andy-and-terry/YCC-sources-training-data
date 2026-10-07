function debounce<A extends unknown[]>(fn: (...args: A) => void, wait: number) {
  let timer: ReturnType<typeof setTimeout> | undefined;
  return (...args: A): void => {
    if (timer !== undefined) clearTimeout(timer);
    timer = setTimeout(() => fn(...args), wait);
  };
}

function throttle<A extends unknown[]>(fn: (...args: A) => void, interval: number) {
  let last = -Infinity;
  return (...args: A): void => {
    const now = Date.now();
    if (now - last >= interval) {
      last = now;
      fn(...args);
    }
  };
}

const log = debounce((msg: string) => console.log("debounced:", msg), 20);
log("a");
log("b");
log("c");

const t = throttle((n: number) => console.log("throttled:", n), 1000);
for (let i = 0; i < 5; i++) t(i);
