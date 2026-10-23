// Lucas numbers via a generator.
function* lucas() {
  let [a, b] = [2, 1];
  while (true) {
    yield a;
    [a, b] = [b, a + b];
  }
}

const out = [];
for (const x of lucas()) {
  if (out.length === 10) break;
  out.push(x);
}
console.log(out.join(" "));
