function multiply(a, b) {
  if (a === "0" || b === "0") return "0";
  const res = new Array(a.length + b.length).fill(0);
  for (let i = a.length - 1; i >= 0; i--) {
    for (let j = b.length - 1; j >= 0; j--) {
      const prod = (a.charCodeAt(i) - 48) * (b.charCodeAt(j) - 48) + res[i + j + 1];
      res[i + j + 1] = prod % 10;
      res[i + j] += Math.floor(prod / 10);
    }
  }
  return res.join("").replace(/^0+/, "");
}

console.log(multiply("123", "456"));
const big = "99999999999999999999";
console.log(multiply(big, big) === (BigInt(big) * BigInt(big)).toString());
