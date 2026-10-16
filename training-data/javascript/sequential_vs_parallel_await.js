const delay = (ms, v) => new Promise((r) => setTimeout(() => r(v), ms));

async function sequential() {
  const start = Date.now();
  const a = await delay(50, "a");
  const b = await delay(50, "b");
  return [a + b, Date.now() - start];
}

async function parallel() {
  const start = Date.now();
  const [a, b] = await Promise.all([delay(50, "a"), delay(50, "b")]);
  return [a + b, Date.now() - start];
}

(async () => {
  const [s, sMs] = await sequential();
  const [p, pMs] = await parallel();
  console.log(s, p, "parallel is faster:", pMs < sMs);
})();
