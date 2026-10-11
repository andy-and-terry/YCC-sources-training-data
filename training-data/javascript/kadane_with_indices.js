function maxSubarray(nums) {
  let best = nums[0];
  let cur = nums[0];
  let start = 0;
  let bestStart = 0;
  let bestEnd = 0;
  for (let i = 1; i < nums.length; i++) {
    if (cur < 0) {
      cur = nums[i];
      start = i;
    } else {
      cur += nums[i];
    }
    if (cur > best) {
      best = cur;
      bestStart = start;
      bestEnd = i;
    }
  }
  return { sum: best, slice: nums.slice(bestStart, bestEnd + 1) };
}

console.log(maxSubarray([-2, 1, -3, 4, -1, 2, 1, -5, 4]));
console.log(maxSubarray([-3, -1, -2]));
