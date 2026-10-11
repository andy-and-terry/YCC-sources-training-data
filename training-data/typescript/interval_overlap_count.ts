function maxConcurrent(intervals: Array<[number, number]>): number {
  const events: Array<[number, number]> = [];
  for (const [start, end] of intervals) {
    events.push([start, 1]);
    events.push([end, -1]);
  }
  events.sort((a, b) => a[0] - b[0] || a[1] - b[1]);
  let active = 0;
  let peak = 0;
  for (const [, delta] of events) {
    active += delta;
    peak = Math.max(peak, active);
  }
  return peak;
}

console.log(maxConcurrent([[0, 30], [5, 10], [15, 20]]));
console.log(maxConcurrent([[7, 10], [2, 4]]));
console.log(maxConcurrent([[1, 5], [2, 6], [3, 7], [4, 8]]));
