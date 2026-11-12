async function* pages(n) {
  for (let i = 1; i <= n; i++) {
    await new Promise((r) => setTimeout(r, 1));
    yield { page: i, items: [i * 10, i * 10 + 1] };
  }
}
(async () => {
  for await (const p of pages(3)) console.log(p.page, p.items);
})();
