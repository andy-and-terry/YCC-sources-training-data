function subsetsWithDup(nums: number[]): number[][] {
  const sorted = [...nums].sort((a, b) => a - b);
  const result: number[][] = [];
  const path: number[] = [];

  function dfs(start: number): void {
    result.push([...path]);
    for (let i = start; i < sorted.length; i++) {
      if (i > start && sorted[i] === sorted[i - 1]) continue;
      path.push(sorted[i]);
      dfs(i + 1);
      path.pop();
    }
  }

  dfs(0);
  return result;
}

console.log(JSON.stringify(subsetsWithDup([1, 2, 2])));
