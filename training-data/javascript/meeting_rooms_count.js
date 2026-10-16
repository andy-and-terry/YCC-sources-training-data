function minMeetingRooms(intervals) {
  const starts = intervals.map((i) => i[0]).sort((a, b) => a - b);
  const ends = intervals.map((i) => i[1]).sort((a, b) => a - b);
  let rooms = 0;
  let max = 0;
  let e = 0;
  for (let s = 0; s < starts.length; s++) {
    if (starts[s] < ends[e]) {
      rooms++;
    } else {
      e++;
    }
    max = Math.max(max, rooms);
  }
  return max;
}

console.log(minMeetingRooms([[0, 30], [5, 10], [15, 20]]));
console.log(minMeetingRooms([[7, 10], [2, 4]]));
console.log(minMeetingRooms([[1, 5], [2, 6], [3, 7], [8, 9]]));
