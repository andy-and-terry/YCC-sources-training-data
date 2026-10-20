// Promise.allSettled plus a timeout wrapper built on Promise.race.
const delay = (ms, value, fail = false) =>
  new Promise((res, rej) => setTimeout(() => (fail ? rej(new Error(value)) : res(value)), ms));

const withTimeout = (promise, ms) =>
  Promise.race([promise, new Promise((_, rej) => setTimeout(() => rej(new Error("timeout")), ms))]);

(async () => {
  const results = await Promise.allSettled([
    delay(10, "ok"),
    delay(10, "boom", true),
    withTimeout(delay(200, "slow"), 20),
  ]);
  for (const r of results) console.log(r.status, r.value ?? r.reason.message);
})();
