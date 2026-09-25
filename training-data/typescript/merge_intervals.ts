type Interval = [start: number, end: number];

function mergeIntervals(intervals: Interval[]): Interval[] {
  if (intervals.length === 0) return [];
  const sorted = [...intervals].sort((a, b) => a[0] - b[0]);
  const merged: Interval[] = [sorted[0]];
  for (const [start, end] of sorted.slice(1)) {
    const last = merged[merged.length - 1];
    if (start <= last[1]) {
      last[1] = Math.max(last[1], end);
    } else {
      merged.push([start, end]);
    }
  }
  return merged;
}

function canAttendAll(intervals: Interval[]): boolean {
  const sorted = [...intervals].sort((a, b) => a[0] - b[0]);
  return sorted.every((interval, i) => i === 0 || interval[0] >= sorted[i - 1][1]);
}

console.log(mergeIntervals([[1, 3], [2, 6], [8, 10], [15, 18]]));
console.log(canAttendAll([[1, 3], [2, 6]]));
console.log(canAttendAll([[1, 2], [2, 3], [3, 4]]));
