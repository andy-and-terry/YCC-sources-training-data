function cubeFromOdds(n) {
  const start = n * n - n + 1;
  let sum = 0;
  for (let i = 0; i < n; i++) sum += start + 2 * i;
  return sum;
}

for (let n = 1; n <= 5; n++) {
  console.log(n, cubeFromOdds(n), cubeFromOdds(n) === n ** 3);
}
