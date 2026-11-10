function moserDeBruijn(i: number): number {
  let value = 0;
  let power = 1;
  for (; i > 0; i >>= 1) {
    if (i & 1) value += power;
    power *= 4;
  }
  return value;
}
console.log(Array.from({ length: 10 }, (_, i) => moserDeBruijn(i)).join(" ")); // 0 1 4 5 16 17 20 21 64 65
