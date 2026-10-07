function isArmstrong(n) {
  const digits = String(n);
  const k = digits.length;
  let sum = 0;
  for (const d of digits) sum += Number(d) ** k;
  return sum === n;
}

const found = [];
for (let n = 1; n < 100000; n++) if (isArmstrong(n)) found.push(n);
console.log(found);
module.exports = { isArmstrong };
