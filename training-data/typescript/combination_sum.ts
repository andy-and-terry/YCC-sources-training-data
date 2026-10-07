function combinationSum(candidates: number[], target: number): number[][] {
  const result: number[][] = [];
  const current: number[] = [];
  const sorted = [...candidates].sort((a, b) => a - b);

  function backtrack(start: number, remaining: number): void {
    if (remaining === 0) {
      result.push([...current]);
      return;
    }
    for (let i = start; i < sorted.length; i++) {
      if (sorted[i] > remaining) break;
      current.push(sorted[i]);
      backtrack(i, remaining - sorted[i]);
      current.pop();
    }
  }

  backtrack(0, target);
  return result;
}

console.log(combinationSum([2, 3, 6, 7], 7));
