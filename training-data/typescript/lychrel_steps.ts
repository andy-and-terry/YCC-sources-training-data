// Reverse-and-add until a palindrome; report the number of steps.
const rev = (n: bigint): bigint => BigInt(n.toString().split("").reverse().join(""));
function steps(start: number): number | null {
  let n = BigInt(start);
  for (let count = 0; count < 100; count++) {
    if (count > 0 && n === rev(n)) return count;
    n += rev(n);
  }
  return null;
}
console.log([56, 57, 59, 79, 89].map(steps).join(" "));
