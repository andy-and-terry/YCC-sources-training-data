function maxNonOverlapping(intervals) {
  const chosen = [];
  let end = -Infinity;
  for (const [s, e] of [...intervals].sort((a, b) => a[1] - b[1])) {
    if (s >= end) {
      chosen.push([s, e]);
      end = e;
    }
  }
  return chosen;
}

function minRooms(intervals) {
  const events = intervals.flatMap(([s, e]) => [[s, 1], [e, -1]]).sort((a, b) => a[0] - b[0] || a[1] - b[1]);
  let cur = 0, best = 0;
  for (const [, d] of events) best = Math.max(best, (cur += d));
  return best;
}

const meetings = [[1, 4], [3, 5], [0, 6], [5, 7], [3, 9], [5, 9], [6, 10], [8, 11], [8, 12], [2, 14], [12, 16]];
console.log(JSON.stringify(maxNonOverlapping(meetings)), "rooms:", minRooms(meetings));
module.exports = { maxNonOverlapping, minRooms };
