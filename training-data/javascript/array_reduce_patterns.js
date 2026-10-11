const nums = [3, 1, 4, 1, 5, 9, 2, 6];

const sum = nums.reduce((a, b) => a + b, 0);
const max = nums.reduce((a, b) => (b > a ? b : a), -Infinity);
const unique = nums.reduce((acc, n) => (acc.includes(n) ? acc : [...acc, n]), []);
const freq = nums.reduce((acc, n) => ({ ...acc, [n]: (acc[n] || 0) + 1 }), {});
const pipeline = [(x) => x + 1, (x) => x * 2, (x) => x - 3].reduce((v, f) => f(v), 5);
const flattened = [[1, 2], [3], [4, 5]].reduce((a, b) => a.concat(b), []);
const runningTotals = nums.reduce((acc, n) => [...acc, (acc.at(-1) ?? 0) + n], []);

console.log(sum, max, unique);
console.log(freq);
console.log(pipeline, flattened);
console.log(runningTotals);
