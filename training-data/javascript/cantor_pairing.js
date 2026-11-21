// Cantor pairing function and its inverse.
const pair = (x, y) => ((x + y) * (x + y + 1)) / 2 + y;
function unpair(z) {
  const w = Math.floor((Math.sqrt(8 * z + 1) - 1) / 2);
  const y = z - (w * (w + 1)) / 2;
  return [w - y, y];
}
console.log(pair(3, 4));
console.log(unpair(32).join(" "));
