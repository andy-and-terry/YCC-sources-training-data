function moveZeroes(nums) {
  let write = 0;
  for (const x of nums) if (x !== 0) nums[write++] = x;
  nums.fill(0, write);
  return nums;
}

console.log(moveZeroes([0, 1, 0, 3, 12, 0, 7]));
module.exports = { moveZeroes };
