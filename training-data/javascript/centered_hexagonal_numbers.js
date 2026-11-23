// 3n(n-1)+1
function term(n) {
  return ((3 * n) * (n - 1)) + 1;
}

for (let n = 1; n <= 15; n++) {
  console.log(`${n} -> ${term(n)}`);
}
