// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
function isBouncy(n: number): boolean {
  const d: string[] = String(n).split("");
  const s = d.join("");
  const up = [...d].sort().join("");
  const down = [...d].sort().reverse().join("");
  return s !== up && s !== down;
}
let count = 0;
for (let n = 1; n < 1000; n++) if (isBouncy(n)) count++;
console.log(count);
