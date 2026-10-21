// Derangement counts: D(n) = (n-1) * (D(n-1) + D(n-2)).
function derangements(n) {
  let a = 1, b = 0;
  if (n === 0) return a;
  for (let i = 2; i <= n; i++) [a, b] = [b, (i - 1) * (a + b)];
  return b;
}

console.log(Array.from({ length: 8 }, (_, i) => derangements(i)).join(" "));
