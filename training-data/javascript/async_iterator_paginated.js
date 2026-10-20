async function* pages(total, size) {
  for (let start = 0; start < total; start += size) {
    await new Promise((r) => setTimeout(r, 5));
    yield Array.from({ length: Math.min(size, total - start) }, (_, i) => start + i);
  }
}

(async () => {
  let seen = 0;
  for await (const page of pages(7, 3)) {
    seen += page.length;
    console.log(page);
  }
  console.log("total", seen);
})();
