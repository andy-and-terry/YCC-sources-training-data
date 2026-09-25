function threeSum(nums, target = 0) {
  const a = [...nums].sort((x, y) => x - y);
  const res = [];
  for (let i = 0; i < a.length - 2; i++) {
    if (i > 0 && a[i] === a[i - 1]) continue;
    let lo = i + 1, hi = a.length - 1;
    while (lo < hi) {
      const s = a[i] + a[lo] + a[hi];
      if (s < target) lo++;
      else if (s > target) hi--;
      else {
        res.push([a[i], a[lo], a[hi]]);
        while (lo < hi && a[lo] === a[lo + 1]) lo++;
        while (lo < hi && a[hi] === a[hi - 1]) hi--;
        lo++;
        hi--;
      }
    }
  }
  return res;
}

console.log(JSON.stringify(threeSum([-1, 0, 1, 2, -1, -4])));
console.log(JSON.stringify(threeSum([1, 2, 3, 4, 5, 6], 10)));
module.exports = { threeSum };
