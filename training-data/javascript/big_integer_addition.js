function addStrings(a, b) {
  let i = a.length - 1, j = b.length - 1, carry = 0;
  const out = [];
  while (i >= 0 || j >= 0 || carry) {
    const s = (i >= 0 ? +a[i--] : 0) + (j >= 0 ? +b[j--] : 0) + carry;
    out.push(s % 10);
    carry = Math.floor(s / 10);
  }
  return out.reverse().join("") || "0";
}

function multiplyStrings(a, b) {
  const res = new Array(a.length + b.length).fill(0);
  for (let i = a.length - 1; i >= 0; i--) {
    for (let j = b.length - 1; j >= 0; j--) {
      const p = +a[i] * +b[j] + res[i + j + 1];
      res[i + j + 1] = p % 10;
      res[i + j] += Math.floor(p / 10);
    }
  }
  return res.join("").replace(/^0+(?=\d)/, "");
}

console.log(addStrings("99999999999999999999", "1"));
console.log(multiplyStrings("123456789", "987654321"), String(123456789n * 987654321n));
module.exports = { addStrings, multiplyStrings };
