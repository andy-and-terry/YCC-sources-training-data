function hammingString(a, b) {
  if (a.length !== b.length) throw new RangeError("strings must have equal length");
  let d = 0;
  for (let i = 0; i < a.length; i++) if (a[i] !== b[i]) d++;
  return d;
}

function hammingInt(x, y) {
  let v = (x ^ y) >>> 0;
  let count = 0;
  while (v) {
    v &= v - 1;
    count++;
  }
  return count;
}

console.log(hammingString("karolin", "kathrin"), hammingInt(1, 4), hammingInt(255, 0));
module.exports = { hammingString, hammingInt };
