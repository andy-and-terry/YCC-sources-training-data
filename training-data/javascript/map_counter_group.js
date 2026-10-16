function countBy(items, keyFn) {
  const counts = new Map();
  for (const item of items) {
    const k = keyFn(item);
    counts.set(k, (counts.get(k) ?? 0) + 1);
  }
  return counts;
}

function groupBy(items, keyFn) {
  const groups = new Map();
  for (const item of items) {
    const k = keyFn(item);
    if (!groups.has(k)) groups.set(k, []);
    groups.get(k).push(item);
  }
  return groups;
}

const words = ["apple", "avocado", "banana", "blueberry", "cherry", "apricot"];
console.log(countBy(words, (w) => w[0]));
console.log(groupBy(words, (w) => w.length));
console.log([...countBy("mississippi", (c) => c)].sort((x, y) => y[1] - x[1])[0]);
