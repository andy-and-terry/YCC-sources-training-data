const key = (x, y) => `${x},${y}`;

function step(live) {
  const counts = new Map();
  for (const cell of live) {
    const [x, y] = cell.split(",").map(Number);
    for (let dx = -1; dx <= 1; dx++)
      for (let dy = -1; dy <= 1; dy++)
        if (dx || dy) counts.set(key(x + dx, y + dy), (counts.get(key(x + dx, y + dy)) || 0) + 1);
  }
  const next = new Set();
  for (const [cell, n] of counts) if (n === 3 || (n === 2 && live.has(cell))) next.add(cell);
  return next;
}

function show(live, w, h) {
  const rows = [];
  for (let y = 0; y < h; y++) {
    let s = "";
    for (let x = 0; x < w; x++) s += live.has(key(x, y)) ? "#" : ".";
    rows.push(s);
  }
  return rows.join("\n");
}

let glider = new Set(["1,0", "2,1", "0,2", "1,2", "2,2"]);
for (let gen = 0; gen < 4; gen++) {
  console.log(`gen ${gen}\n${show(glider, 6, 6)}\n`);
  glider = step(glider);
}
module.exports = { step };
