// n(2n^2+1)/3
function term(n) {
  return Math.floor((n * (((2 * n) * n) + 1)) / 3);
}

for (let n = 1; n <= 15; n++) {
  console.log(`${n} -> ${term(n)}`);
}
