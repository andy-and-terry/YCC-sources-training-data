function shoelace(pts) {
  const s = pts.reduce((acc, [x1, y1], i) => {
    const [x2, y2] = pts[(i + 1) % pts.length];
    return acc + x1 * y2 - x2 * y1;
  }, 0);
  return Math.abs(s) / 2;
}

console.log(shoelace([[0, 0], [4, 0], [4, 3], [0, 3]]));
