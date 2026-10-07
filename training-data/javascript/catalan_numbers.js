function catalanDp(n) {
  const c = new Array(n + 1).fill(0n);
  c[0] = 1n;
  for (let i = 1; i <= n; i++) for (let j = 0; j < i; j++) c[i] += c[j] * c[i - 1 - j];
  return c;
}

function catalanClosed(n) {
  let c = 1n;
  for (let k = 0n; k < BigInt(n); k++) c = (c * 2n * (2n * k + 1n)) / (k + 2n);
  return c;
}

const dp = catalanDp(20);
console.log(dp.join(" "));
console.log("closed form agrees:", dp.every((v, i) => v === catalanClosed(i)));
module.exports = { catalanDp, catalanClosed };
