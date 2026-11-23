// n(n+1)(n+2)(n+3)/24
function term(n) {
  return Math.floor((((n * (n + 1)) * (n + 2)) * (n + 3)) / 24);
}

for (let n = 1; n <= 15; n++) {
  console.log(`${n} -> ${term(n)}`);
}
