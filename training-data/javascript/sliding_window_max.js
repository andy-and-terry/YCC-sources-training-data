function maxSlidingWindow(nums, k) {
  const dq = [];
  const result = [];
  for (let i = 0; i < nums.length; i++) {
    while (dq.length > 0 && nums[dq.at(-1)] <= nums[i]) dq.pop();
    dq.push(i);
    if (dq[0] <= i - k) dq.shift();
    if (i >= k - 1) result.push(nums[dq[0]]);
  }
  return result;
}

console.log(maxSlidingWindow([1, 3, -1, -3, 5, 3, 6, 7], 3));
module.exports = { maxSlidingWindow };
