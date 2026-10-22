// Farey sequence F_n via the next-term recurrence (no sorting or gcd needed).
function farey(n: number): string[] {
  const out: string[] = ["0/1"];
  let a = 0, b = 1, c = 1, d = n;
  while (c <= n) {
    const k = Math.floor((n + b) / d);
    [a, b, c, d] = [c, d, k * c - a, k * d - b];
    out.push(`${a}/${b}`);
    if (a === 1 && b === 1) break;
  }
  return out;
}

console.log(farey(5).join(" "));
