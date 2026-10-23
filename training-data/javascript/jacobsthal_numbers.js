// Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
function* jacobsthal() {
  let [a, b] = [0, 1];
  while (true) {
    yield a;
    [a, b] = [b, b + 2 * a];
  }
}

const terms = [];
for (const j of jacobsthal()) {
  if (terms.length === 15) break;
  terms.push(j);
}
console.log(terms.join(" "));
