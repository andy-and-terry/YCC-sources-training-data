export interface RobPlan { total: number; houses: number[] }

export function robPlan(values: readonly number[]): RobPlan {
  const n = values.length;
  const best = new Array<number>(n + 2).fill(0);
  for (let i = n - 1; i >= 0; i--) best[i] = Math.max(best[i + 1], values[i] + best[i + 2]);
  const houses: number[] = [];
  for (let i = 0; i < n; ) {
    if (values[i] + best[i + 2] >= best[i + 1]) {
      houses.push(i);
      i += 2;
    } else i++;
  }
  return { total: best[0], houses };
}

console.log(robPlan([2, 7, 9, 3, 1]), robPlan([5, 1, 1, 5]));
