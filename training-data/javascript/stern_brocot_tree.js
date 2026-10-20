const gcd = (a, b) => (b === 0 ? a : gcd(b, a % b));

function path(p, q) {
  const g = gcd(p, q);
  p /= g; q /= g;
  let lo = [0, 1], hi = [1, 0];
  let s = "";
  for (;;) {
    const mid = [lo[0] + hi[0], lo[1] + hi[1]];
    if (mid[0] === p && mid[1] === q) return s;
    if (p * mid[1] < mid[0] * q) { s += "L"; hi = mid; }
    else { s += "R"; lo = mid; }
  }
}

console.log(path(3, 5));
