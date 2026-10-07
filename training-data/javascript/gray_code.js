const grayCode = (n) => Array.from({ length: 1 << n }, (_, i) => i ^ (i >> 1));

function grayToBinary(g) {
  let b = 0;
  for (; g; g >>= 1) b ^= g;
  return b;
}

const codes = grayCode(4);
for (const c of codes) console.log(c.toString(2).padStart(4, "0"), grayToBinary(c));
const oneBit = codes.slice(1).every((c, i) => {
  const x = c ^ codes[i];
  return x && (x & (x - 1)) === 0;
});
console.log("adjacent codes differ by one bit:", oneBit);
module.exports = { grayCode, grayToBinary };
