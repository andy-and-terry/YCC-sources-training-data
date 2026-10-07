function debounce(fn, wait) {
  let timer;
  return (...args) => {
    clearTimeout(timer);
    timer = setTimeout(() => fn(...args), wait);
  };
}

function throttle(fn, wait) {
  let last = 0;
  return (...args) => {
    const now = Date.now();
    if (now - last >= wait) {
      last = now;
      fn(...args);
    }
  };
}

const d = debounce((x) => console.log("debounced", x), 50);
const t = throttle((x) => console.log("throttled", x), 50);
for (let i = 0; i < 5; i++) { d(i); t(i); }
