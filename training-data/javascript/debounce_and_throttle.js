function debounce(fn, ms) {
  let t;
  return (...args) => {
    clearTimeout(t);
    t = setTimeout(() => fn(...args), ms);
  };
}

function throttle(fn, ms) {
  let last = 0;
  return (...args) => {
    const now = Date.now();
    if (now - last >= ms) {
      last = now;
      fn(...args);
    }
  };
}

const d = debounce((x) => console.log("debounced", x), 20);
d(1); d(2); d(3);
const t = throttle((x) => console.log("throttled", x), 1000);
t(1); t(2);
