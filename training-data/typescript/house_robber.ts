function rob(nums: number[]): number {
  let prevNo = 0;
  let prevYes = 0;
  for (const num of nums) {
    const newYes = prevNo + num;
    const newNo = Math.max(prevNo, prevYes);
    prevYes = newYes;
    prevNo = newNo;
  }
  return Math.max(prevYes, prevNo);
}

console.log(rob([2, 7, 9, 3, 1]));
console.log(rob([1, 2, 3, 1]));
