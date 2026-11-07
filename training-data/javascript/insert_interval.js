function insertInterval(intervals, next) {
  const out = [];
  let i = 0;
  while (i < intervals.length && intervals[i][1] < next[0]) out.push(intervals[i++]);
  while (i < intervals.length && intervals[i][0] <= next[1]) {
    next = [Math.min(next[0], intervals[i][0]), Math.max(next[1], intervals[i][1])];
    i++;
  }
  out.push(next, ...intervals.slice(i));
  return out;
}

console.log(JSON.stringify(insertInterval([[1, 3], [6, 9]], [2, 5]))); // [[1,5],[6,9]]
