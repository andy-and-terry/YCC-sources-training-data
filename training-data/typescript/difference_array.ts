function applyRangeUpdates(length: number, updates: Array<[number, number, number]>): number[] {
  const diff = new Array<number>(length + 1).fill(0);
  for (const [start, end, delta] of updates) {
    diff[start] += delta;
    diff[end + 1] -= delta;
  }
  const result: number[] = [];
  let running = 0;
  for (let i = 0; i < length; i++) {
    running += diff[i];
    result.push(running);
  }
  return result;
}

console.log(applyRangeUpdates(5, [[1, 3, 2], [2, 4, 3], [0, 2, -2]]));
