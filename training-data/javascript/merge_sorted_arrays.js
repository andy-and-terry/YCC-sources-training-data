function mergeTwo(a, b) {
  const out = [];
  let i = 0, j = 0;
  while (i < a.length && j < b.length) out.push(a[i] <= b[j] ? a[i++] : b[j++]);
  return out.concat(a.slice(i), b.slice(j));
}

function mergeK(arrays) {
  if (arrays.length === 0) return [];
  while (arrays.length > 1) {
    const next = [];
    for (let i = 0; i < arrays.length; i += 2) next.push(i + 1 < arrays.length ? mergeTwo(arrays[i], arrays[i + 1]) : arrays[i]);
    arrays = next;
  }
  return arrays[0];
}

console.log(mergeTwo([1, 4, 7], [2, 3, 8, 9]));
console.log(mergeK([[1, 5, 9], [2, 6], [0, 3, 4, 10]]));
module.exports = { mergeTwo, mergeK };
