// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
function isBouncy(n) {
  const d = String(n).split("");
  const up = [...d].sort().join("");
  const down = [...d].sort().reverse().join("");
  return d.join("") !== up && d.join("") !== down;
}
let count = 0;
for (let n = 1; n < 1000; n++) if (isBouncy(n)) count++;
console.log(count);
