interface Interval {
  start: number;
  end: number;
}

// Greedy: always pick the compatible interval that finishes earliest.
function maxNonOverlapping(intervals: Interval[]): Interval[] {
  const sorted = [...intervals].sort((a, b) => a.end - b.end);
  const chosen: Interval[] = [];
  let lastEnd = -Infinity;
  for (const iv of sorted) {
    if (iv.start >= lastEnd) {
      chosen.push(iv);
      lastEnd = iv.end;
    }
  }
  return chosen;
}

const meetings: Interval[] = [
  { start: 1, end: 4 },
  { start: 3, end: 5 },
  { start: 0, end: 6 },
  { start: 5, end: 7 },
  { start: 8, end: 9 },
  { start: 5, end: 9 },
];
console.log(maxNonOverlapping(meetings));
