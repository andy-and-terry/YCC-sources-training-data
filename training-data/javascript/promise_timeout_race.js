function withTimeout(promise, ms) {
  let timer;
  const timeout = new Promise((_, reject) => {
    timer = setTimeout(() => reject(new Error(`timed out after ${ms}ms`)), ms);
  });
  return Promise.race([promise, timeout]).finally(() => clearTimeout(timer));
}

const delay = (ms, value) => new Promise((resolve) => setTimeout(() => resolve(value), ms));

(async () => {
  console.log(await withTimeout(delay(10, "fast"), 100));
  try {
    await withTimeout(delay(200, "slow"), 30);
  } catch (err) {
    console.log(err.message);
  }
})();
