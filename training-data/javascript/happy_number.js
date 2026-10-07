const step = (n) => String(n).split("").reduce((s, d) => s + d * d, 0);

function isHappy(n) {
  let slow = n, fast = step(n);
  while (fast !== 1 && slow !== fast) {
    slow = step(slow);
    fast = step(step(fast));
  }
  return fast === 1;
}

console.log(Array.from({ length: 50 }, (_, i) => i + 1).filter(isHappy));
