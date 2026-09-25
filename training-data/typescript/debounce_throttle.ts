export function debounce<A extends unknown[]>(fn: (...args: A) => void, wait: number) {
  let timer: ReturnType<typeof setTimeout> | undefined;
  return (...args: A): void => {
    if (timer) clearTimeout(timer);
    timer = setTimeout(() => fn(...args), wait);
  };
}

export function throttle<A extends unknown[]>(fn: (...args: A) => void, wait: number) {
  let last = -Infinity;
  return (...args: A): void => {
    const now = Date.now();
    if (now - last < wait) return;
    last = now;
    fn(...args);
  };
}

const log = debounce((n: number) => console.log("settled on", n), 20);
[1, 2, 3].forEach(log);
