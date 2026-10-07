function combinationSum(candidates, target) {
  const c = [...candidates].sort((a, b) => a - b);
  const out = [];
  const path = [];
  (function backtrack(start, remaining) {
    if (remaining === 0) return void out.push([...path]);
    for (let i = start; i < c.length && c[i] <= remaining; i++) {
      path.push(c[i]);
      backtrack(i, remaining - c[i]);
      path.pop();
    }
  })(0, target);
  return out;
}

console.log(JSON.stringify(combinationSum([2, 3, 6, 7], 7)));
console.log(JSON.stringify(combinationSum([2, 3, 5], 8)));
module.exports = { combinationSum };
