const intersectionUnique = (a, b) => {
  const sb = new Set(b);
  return [...new Set(a)].filter((x) => sb.has(x)).sort((x, y) => x - y);
};

function intersectionMultiset(a, b) {
  const counts = new Map();
  for (const x of a) counts.set(x, (counts.get(x) || 0) + 1);
  const out = [];
  for (const x of b) {
    if (counts.get(x) > 0) {
      out.push(x);
      counts.set(x, counts.get(x) - 1);
    }
  }
  return out;
}

const x = [4, 9, 5, 4, 4], y = [9, 4, 9, 8, 4];
console.log(intersectionUnique(x, y), intersectionMultiset(x, y));
module.exports = { intersectionUnique, intersectionMultiset };
