// Cyclops numbers: odd digit count, middle digit zero, no other zeros.
// Count those in 1..99999 (expected 6642).
function isCyclops(n: number): boolean {
  const s: string = String(n);
  return s.length % 2 === 1 && s[s.length >> 1] === "0" && s.split("0").length === 2;
}
let count: number = 0;
for (let n = 1; n < 100000; n++) if (isCyclops(n)) count++;
console.log(count);
