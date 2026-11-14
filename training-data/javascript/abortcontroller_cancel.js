function wait(ms, signal) {
  return new Promise((resolve, reject) => {
    const t = setTimeout(resolve, ms);
    signal.addEventListener("abort", () => {
      clearTimeout(t);
      reject(new Error("aborted"));
    });
  });
}

const ac = new AbortController();
wait(1000, ac.signal).catch((e) => console.log(e.message));
setTimeout(() => ac.abort(), 10);
