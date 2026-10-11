function nextGreaterElements(nums: number[]): number[] {
  const result = new Array<number>(nums.length).fill(-1);
  const stack: number[] = [];
  for (let i = 0; i < nums.length; i++) {
    while (stack.length > 0 && nums[stack[stack.length - 1]] < nums[i]) {
      result[stack.pop()!] = nums[i];
    }
    stack.push(i);
  }
  return result;
}

console.log(nextGreaterElements([2, 1, 2, 4, 3]));
console.log(nextGreaterElements([5, 4, 3]));
