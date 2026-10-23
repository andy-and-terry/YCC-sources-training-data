// AbortController lets callers cancel async work cooperatively.

function sleep(ms, signal) {
  return new Promise((resolve, reject) => {
    if (signal.aborted) return reject(signal.reason);
    const timer = setTimeout(resolve, ms);
    signal.addEventListener("abort", () => {
      clearTimeout(timer);
      reject(signal.reason);
    }, { once: true });
  });
}

async function main() {
  const ctrl = new AbortController();
  ctrl.signal.addEventListener("abort", () => console.log("abort event fired"));

  const task = sleep(1000, ctrl.signal).then(
    () => "finished",
    (err) => `cancelled: ${err.message}`
  );

  setTimeout(() => ctrl.abort(new Error("user pressed stop")), 20);
  console.log(await task);

  // Built-in helper that aborts after a delay
  const timed = AbortSignal.timeout(10);
  try {
    await sleep(500, timed);
  } catch (err) {
    console.log("timeout name:", err.name);
  }
  console.log("aborted:", ctrl.signal.aborted, timed.aborted);
}

main();
