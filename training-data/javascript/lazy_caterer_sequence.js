// n(n+1)/2+1
function term(n) {
  return Math.floor((n * (n + 1)) / 2) + 1;
}

for (let n = 1; n <= 15; n++) {
  console.log(`${n} -> ${term(n)}`);
}
