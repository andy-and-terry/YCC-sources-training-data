// Squarefree numbers up to 100; expect 61.
const squarefree = (n: number): boolean => {
  for (let d = 2; d * d <= n; d++) if (n % (d * d) === 0) return false;
  return true;
};
let count = 0;
for (let n = 1; n <= 100; n++) if (squarefree(n)) count++;
console.log(count);
