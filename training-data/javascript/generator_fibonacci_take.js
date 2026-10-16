function* fibonacci() {
  let [a, b] = [0, 1];
  while (true) {
    yield a;
    [a, b] = [b, a + b];
  }
}

function* take(iterable, n) {
  if (n <= 0) return;
  let i = 0;
  for (const item of iterable) {
    yield item;
    if (++i >= n) return;
  }
}

function* filter(iterable, pred) {
  for (const x of iterable) if (pred(x)) yield x;
}

console.log([...take(fibonacci(), 10)]);
console.log([...take(filter(fibonacci(), (n) => n % 2 === 0), 5)]);
