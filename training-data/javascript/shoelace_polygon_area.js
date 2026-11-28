function area(pts) {
  let s = 0;
  pts.forEach(([x1, y1], i) => {
    const [x2, y2] = pts[(i + 1) % pts.length];
    s += x1 * y2 - x2 * y1;
  });
  return Math.abs(s) / 2;
}

console.log(area([[0, 0], [4, 0], [4, 3], [0, 3]])); // 12
