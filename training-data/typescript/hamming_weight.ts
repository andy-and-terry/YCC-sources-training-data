function popcount(n: number): number {
  let count = 0;
  while (n) {
    n &= n - 1;
    count++;
  }
  return count;
}
console.log(popcount(0b10110111));
