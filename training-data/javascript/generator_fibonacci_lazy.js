// Lazy infinite generator composed with a take() helper.
function* fibonacci() {
  let [a, b] = [0, 1];
  while (true) {
    yield a;
    [a, b] = [b, a + b];
  }
}

function* take(iterable, n) {
  let i = 0;
  for (const value of iterable) {
    if (i++ >= n) return;
    yield value;
  }
}

console.log([...take(fibonacci(), 10)]);
