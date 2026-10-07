const sleep = (ms) => new Promise((r) => setTimeout(r, ms));

async function retry(fn, { attempts = 5, baseMs = 10, capMs = 200, shouldRetry = () => true } = {}) {
  for (let attempt = 1; ; attempt++) {
    try {
      return await fn(attempt);
    } catch (err) {
      if (attempt >= attempts || !shouldRetry(err)) throw err;
      const delay = Math.random() * Math.min(capMs, baseMs * 2 ** attempt);
      console.log(`attempt ${attempt} failed (${err.message}); retrying in ${delay.toFixed(0)}ms`);
      await sleep(delay);
    }
  }
}

let calls = 0;
retry(async () => {
  if (++calls < 4) throw new Error("temporary failure");
  return "ok";
}).then((v) => console.log(v, "after", calls, "calls"));
module.exports = { retry };
