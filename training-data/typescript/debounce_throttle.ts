function debounce<A extends unknown[]>(fn: (...args: A) => void, waitMs: number) {
  let timer: ReturnType<typeof setTimeout> | undefined;
  return (...args: A): void => {
    if (timer !== undefined) clearTimeout(timer);
    timer = setTimeout(() => fn(...args), waitMs);
  };
}

function throttle<A extends unknown[]>(fn: (...args: A) => void, intervalMs: number) {
  let last = 0;
  return (...args: A): void => {
    const now = Date.now();
    if (now - last >= intervalMs) {
      last = now;
      fn(...args);
    }
  };
}

const debounced = debounce((msg: string) => console.log("debounced:", msg), 50);
debounced("a");
debounced("b");
debounced("c"); // only "c" is logged

const throttled = throttle((n: number) => console.log("throttled:", n), 1000);
for (let i = 0; i < 5; i++) throttled(i); // only 0 is logged
