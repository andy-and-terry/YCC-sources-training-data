// Population count (number of set bits) for 0..15
const bits = (n) => {
  let c = 0;
  for (; n; n &= n - 1) c++;
  return c;
};

console.log(Array.from({ length: 16 }, (_, n) => bits(n)).join(" "));
