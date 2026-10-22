function lucky(limit: number): number[] {
  let nums: number[] = [];
  for (let v = 1; v <= limit; v += 2) nums.push(v);
  for (let i = 1; i < nums.length && nums[i] <= nums.length; i++) {
    const step = nums[i];
    nums = nums.filter((_, idx) => (idx + 1) % step !== 0);
  }
  return nums;
}

console.log(lucky(50).join(" "));
