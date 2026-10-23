// a(n) = 1 + a(n - a(a(n - 1))), 1-based indexing
function golomb(count) {
  const a = [0, 1];
  for (let n = 2; n <= count; n++) a[n] = 1 + a[n - a[a[n - 1]]];
  return a.slice(1);
}

console.log(golomb(20).join(" "));
