async function* ticks(n) {
  for (let i = 0; i < n; i++) {
    await new Promise(r => setTimeout(r, 10));
    yield i;
  }
}
(async () => {
  for await (const t of ticks(3)) console.log('tick', t);
})();
