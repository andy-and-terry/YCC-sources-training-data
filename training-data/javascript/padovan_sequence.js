// Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
function* padovan() {
  let [a, b, c] = [1, 1, 1];
  while (true) {
    yield a;
    [a, b, c] = [b, c, a + b];
  }
}

const terms = [];
for (const v of padovan()) {
  if (terms.length === 15) break;
  terms.push(v);
}
console.log(terms.join(" "));
