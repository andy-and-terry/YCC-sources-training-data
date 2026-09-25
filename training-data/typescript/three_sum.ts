export type Triple = [number, number, number];

export function threeSum(nums: readonly number[], target = 0): Triple[] {
  const a = [...nums].sort((x, y) => x - y);
  const res: Triple[] = [];
  for (let i = 0; i < a.length - 2; i++) {
    if (i > 0 && a[i] === a[i - 1]) continue;
    let lo = i + 1, hi = a.length - 1;
    while (lo < hi) {
      const s = a[i] + a[lo] + a[hi];
      if (s < target) lo++;
      else if (s > target) hi--;
      else {
        res.push([a[i], a[lo], a[hi]]);
        while (lo < hi && a[lo] === a[++lo]);
        while (lo < hi && a[hi] === a[--hi]);
      }
    }
  }
  return res;
}

console.log(JSON.stringify(threeSum([-1, 0, 1, 2, -1, -4])));
console.log(JSON.stringify(threeSum([1, 2, 3, 4, 5, 6], 10)));
