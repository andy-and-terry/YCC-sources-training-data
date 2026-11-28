const isArmstrong = (n: number): boolean => {
  const digits = [...String(n)].map(Number);
  return digits.reduce((s, d) => s + d ** digits.length, 0) === n;
};

const result: number[] = [];
for (let n = 1; n < 1000; n++) if (isArmstrong(n)) result.push(n);
console.log(result); // [1..9, 153, 370, 371, 407]
