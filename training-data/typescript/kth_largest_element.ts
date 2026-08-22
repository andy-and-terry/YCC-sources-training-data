function kthLargest(nums: number[], k: number): number {
  return [...nums].sort((a, b) => b - a)[k - 1];
}

console.log(kthLargest([3, 2, 1, 5, 6, 4], 2));
