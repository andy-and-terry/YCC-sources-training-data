function histogram(values, width = 40) {
  const counts = new Map();
  for (const v of values) counts.set(v, (counts.get(v) || 0) + 1);
  const peak = Math.max(...counts.values());
  return [...counts.keys()].sort().map((k) => {
    const n = counts.get(k);
    return `${String(k).padStart(6)} | ${"#".repeat(Math.max(1, Math.round((n / peak) * width)))} ${n}`;
  }).join("\n");
}

console.log(histogram("theraininspainfallsmainlyontheplain"));
