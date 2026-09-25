/** Each candidate may be used at most once; duplicates in input are handled. */
export function combinationSumUnique(candidates: readonly number[], target: number): number[][] {
  const c = [...candidates].sort((a, b) => a - b);
  const out: number[][] = [];
  const path: number[] = [];
  const backtrack = (start: number, remaining: number): void => {
    if (remaining === 0) {
      out.push([...path]);
      return;
    }
    for (let i = start; i < c.length && c[i] <= remaining; i++) {
      if (i > start && c[i] === c[i - 1]) continue;
      path.push(c[i]);
      backtrack(i + 1, remaining - c[i]);
      path.pop();
    }
  };
  backtrack(0, target);
  return out;
}

console.log(JSON.stringify(combinationSumUnique([10, 1, 2, 7, 6, 1, 5], 8)));
console.log(JSON.stringify(combinationSumUnique([2, 5, 2, 1, 2], 5)));
