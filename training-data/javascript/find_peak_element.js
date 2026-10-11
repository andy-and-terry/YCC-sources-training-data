function findPeak(nums) {
  let lo = 0;
  let hi = nums.length - 1;
  while (lo < hi) {
    const mid = (lo + hi) >> 1;
    if (nums[mid] < nums[mid + 1]) lo = mid + 1;
    else hi = mid;
  }
  return lo;
}

const a = [1, 2, 1, 3, 5, 6, 4];
const p = findPeak(a);
console.log(p, a[p]);
console.log(findPeak([1, 2, 3, 4]), findPeak([5, 4, 3]));
