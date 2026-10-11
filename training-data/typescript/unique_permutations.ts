function uniquePermutations(nums: number[]): number[][] {
  const sorted = [...nums].sort((a, b) => a - b);
  const used = new Array<boolean>(sorted.length).fill(false);
  const current: number[] = [];
  const result: number[][] = [];

  const backtrack = (): void => {
    if (current.length === sorted.length) {
      result.push([...current]);
      return;
    }
    for (let i = 0; i < sorted.length; i++) {
      if (used[i]) continue;
      if (i > 0 && sorted[i] === sorted[i - 1] && !used[i - 1]) continue;
      used[i] = true;
      current.push(sorted[i]);
      backtrack();
      current.pop();
      used[i] = false;
    }
  };

  backtrack();
  return result;
}

console.log(uniquePermutations([1, 1, 2]));
