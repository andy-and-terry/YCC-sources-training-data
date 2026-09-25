function collatz(n) {
  const seq = [n];
  while (n !== 1) {
    n = n % 2 === 0 ? n / 2 : 3 * n + 1;
    seq.push(n);
  }
  return seq;
}

const cache = new Map([[1, 0]]);
function steps(start) {
  let n = start;
  const path = [];
  while (!cache.has(n)) {
    path.push(n);
    n = n % 2 === 0 ? n / 2 : 3 * n + 1;
  }
  let s = cache.get(n);
  while (path.length) cache.set(path.pop(), ++s);
  return cache.get(start);
}

console.log(collatz(27).slice(0, 15), "... length", collatz(27).length);
let best = 1;
for (let i = 1; i < 10000; i++) {
  if (steps(i) > cache.get(best)) best = i;
}
console.log("longest under 10000:", best, cache.get(best));
module.exports = { collatz };
