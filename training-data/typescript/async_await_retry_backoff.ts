async function retry<T>(fn: () => Promise<T>, n: number): Promise<T> {
  let last: unknown;
  for (let i = 0; i < n; i++) {
    try { return await fn(); } catch (e) { last = e; await new Promise((r) => setTimeout(r, 2 ** i)); }
  }
  throw last;
}
let calls = 0;
retry(async () => { if (++calls < 3) throw new Error("x"); return calls; }, 5).then(console.log);
