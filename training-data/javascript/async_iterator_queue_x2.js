async function* ticker(n) {
  for (let i = 0; i < n; i++) { await new Promise((r) => setTimeout(r, 1)); yield i; }
}
(async () => { const out = []; for await (const t of ticker(4)) out.push(t); console.log(out); })();
