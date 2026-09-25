/** Greedy BFS-by-levels returning the actual jump path. */
export function jumpPath(nums: readonly number[]): number[] | null {
  const path = [0];
  let i = 0;
  while (i < nums.length - 1) {
    if (i + nums[i] >= nums.length - 1) {
      path.push(nums.length - 1);
      return path;
    }
    let bestNext = -1, bestReach = -1;
    for (let j = i + 1; j <= i + nums[i]; j++) {
      if (j + nums[j] > bestReach) {
        bestReach = j + nums[j];
        bestNext = j;
      }
    }
    if (bestNext < 0 || bestReach <= i) return null;
    path.push(bestNext);
    i = bestNext;
  }
  return path;
}

console.log(jumpPath([2, 3, 1, 1, 4]), jumpPath([3, 2, 1, 0, 4]), jumpPath([1, 1, 1, 1]));
