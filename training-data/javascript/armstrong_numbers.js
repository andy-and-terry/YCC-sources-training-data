const isArmstrong = (n) => {
  const digits = String(n).split("").map(Number);
  return digits.reduce((s, d) => s + d ** digits.length, 0) === n;
};

const result = Array.from({ length: 999 }, (_, i) => i + 1).filter(isArmstrong);
console.log(result); // [1..9, 153, 370, 371, 407]
