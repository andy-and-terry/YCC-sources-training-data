function chunk(arr, size) {
  const out = [];
  for (let i = 0; i < arr.length; i += size) out.push(arr.slice(i, i + size));
  return out;
}

function zip(...arrays) {
  const len = Math.min(...arrays.map((a) => a.length));
  return Array.from({ length: len }, (_, i) => arrays.map((a) => a[i]));
}

function unzip(pairs) {
  return pairs.reduce((acc, row) => row.map((v, i) => [...(acc[i] || []), v]), []);
}

console.log(chunk([1, 2, 3, 4, 5], 2));
console.log(zip([1, 2, 3], ["a", "b", "c"], [true, false]));
console.log(unzip([[1, "a"], [2, "b"]]));

module.exports = { chunk, zip, unzip };
