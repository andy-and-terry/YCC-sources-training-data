function lucky(limit) {
  let nums = [];
  for (let n = 1; n < limit; n += 2) nums.push(n);
  for (let i = 1; i < nums.length && nums[i] <= nums.length; i++) {
    const step = nums[i];
    nums = nums.filter((_, idx) => (idx + 1) % step !== 0);
  }
  return nums;
}

console.log(lucky(100).join(" "));
