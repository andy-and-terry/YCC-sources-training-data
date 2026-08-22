function majorityElement(nums: number[]): number {
  let count = 0;
  let candidate = 0;
  for (const num of nums) {
    if (count === 0) candidate = num;
    count += num === candidate ? 1 : -1;
  }
  return candidate;
}

console.log(majorityElement([2, 2, 1, 1, 1, 2, 2]));
