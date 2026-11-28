function reverseBits(value, width = 8) {
  let result = 0;
  for (let i = 0; i < width; i++) {
    result = (result << 1) | (value & 1);
    value >>>= 1;
  }
  return result >>> 0;
}

for (const v of [1, 6, 13, 128]) console.log(v, reverseBits(v)); // 128 96 176 1
