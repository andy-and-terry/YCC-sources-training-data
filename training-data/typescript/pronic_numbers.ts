function isPronic(x: number): boolean {
  const n = Math.floor(Math.sqrt(x));
  return n * (n + 1) === x;
}

const first10: number[] = Array.from({ length: 10 }, (_, n) => n * (n + 1));
console.log(first10); // [0, 2, 6, 12, 20, 30, 42, 56, 72, 90]
console.log(isPronic(56), isPronic(57)); // true false
