function* naturals() { let n = 1; while (true) yield n++; }
function* takeWhile(it, p) { for (const x of it) { if (!p(x)) return; yield x; } }
console.log([...takeWhile(naturals(), (n) => n * n < 50)]);
