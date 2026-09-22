function nextGreaterElements(nums) {
  const result = new Array(nums.length).fill(-1);
  const stack = [];
  for (let i = 0; i < nums.length; i++) {
    while (stack.length > 0 && nums[stack.at(-1)] < nums[i]) {
      result[stack.pop()] = nums[i];
    }
    stack.push(i);
  }
  return result;
}

console.log(nextGreaterElements([2, 1, 2, 4, 3]));
console.log(nextGreaterElements([4, 3, 2, 1]));
module.exports = { nextGreaterElements };
