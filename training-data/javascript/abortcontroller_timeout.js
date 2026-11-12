const ac = new AbortController();
const work = new Promise((res, rej) => {
  const t = setTimeout(res, 1000, "done");
  ac.signal.addEventListener("abort", () => { clearTimeout(t); rej(ac.signal.reason); });
});
setTimeout(() => ac.abort(new Error("timed out")), 10);
work.catch((e) => console.log(e.message));
