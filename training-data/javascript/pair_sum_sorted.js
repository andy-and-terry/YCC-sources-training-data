function pairWithSum(nums, target) {
  let i = 0, j = nums.length - 1;
  while (i < j) {
    const s = nums[i] + nums[j];
    if (s === target) return [i, j];
    s < target ? i++ : j--;
  }
  return null;
}

console.log(pairWithSum([1, 3, 4, 6, 8, 11], 10));
console.log(pairWithSum([1, 2, 3], 100));
