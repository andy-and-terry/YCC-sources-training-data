// Reverse-and-add until a palindrome; report the number of steps.
const rev = (n) => BigInt(n.toString().split("").reverse().join(""));
function steps(n) {
  n = BigInt(n);
  for (let count = 0; count < 100; count++) {
    if (count > 0 && n === rev(n)) return count;
    n += rev(n);
  }
  return null;
}
console.log([56, 57, 59, 79, 89].map(steps).join(" "));
