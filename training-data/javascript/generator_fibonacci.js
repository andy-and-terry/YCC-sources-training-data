function* fib() {
  let [a, b] = [0, 1];
  while (true) {
    yield a;
    [a, b] = [b, a + b];
  }
}
const out = [];
for (const n of fib()) {
  if (out.length === 10) break;
  out.push(n);
}
console.log(out);
