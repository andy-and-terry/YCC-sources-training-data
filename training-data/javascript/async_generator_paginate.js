async function* pages(total, size) {
  for (let offset = 0; offset < total; offset += size) {
    await new Promise((r) => setTimeout(r, 5));
    yield Array.from({ length: Math.min(size, total - offset) }, (_, i) => offset + i);
  }
}

(async () => {
  for await (const page of pages(7, 3)) console.log(page);
})();
