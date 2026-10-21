// Motzkin numbers via recurrence.
function motzkin(n) {
  const m = [1, 1];
  for (let i = 2; i <= n; i++) {
    m.push(Math.floor(((2 * i + 1) * m[i - 1] + 3 * (i - 1) * m[i - 2]) / (i + 2)));
  }
  return m[n];
}

console.log(Array.from({ length: 10 }, (_, i) => motzkin(i)).join(" "));
