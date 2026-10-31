function isPowerful(n: number): boolean {
  for (let p = 2; p * p <= n; p++) {
    if (n % p === 0) {
      if (n % (p * p) !== 0) return false;
      while (n % p === 0) n /= p;
    }
  }
  return n === 1;
}

const result: number[] = [];
for (let n = 1; n <= 100; n++) if (isPowerful(n)) result.push(n);
console.log(result.join(' '));
