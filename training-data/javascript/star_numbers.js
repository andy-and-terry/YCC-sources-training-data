// 6n(n-1)+1
function term(n) {
  return ((6 * n) * (n - 1)) + 1;
}

for (let n = 1; n <= 15; n++) {
  console.log(`${n} -> ${term(n)}`);
}
