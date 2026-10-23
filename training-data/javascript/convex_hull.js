const cross = (o, a, b) => (a[0] - o[0]) * (b[1] - o[1]) - (a[1] - o[1]) * (b[0] - o[0]);

// Andrew's monotone chain, counter-clockwise result
function convexHull(points) {
  const p = [...points].sort((a, b) => a[0] - b[0] || a[1] - b[1]);
  const build = (seq) => {
    const h = [];
    for (const q of seq) {
      while (h.length >= 2 && cross(h[h.length - 2], h[h.length - 1], q) <= 0) h.pop();
      h.push(q);
    }
    h.pop();
    return h;
  };
  return [...build(p), ...build([...p].reverse())];
}

console.log(convexHull([[0, 0], [2, 0], [1, 1], [2, 2], [0, 2], [1, 3]]));
