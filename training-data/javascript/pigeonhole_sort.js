// Works best when the range of values is close to the number of
// elements: each value gets its own "hole" (bucket) counted by offset
// from the minimum, then holes are read back out in order.
function pigeonholeSort(arr) {
  if (arr.length === 0) return [];
  const min = Math.min(...arr);
  const max = Math.max(...arr);
  const holes = new Array(max - min + 1).fill(0);

  for (const value of arr) holes[value - min]++;

  const result = [];
  for (let i = 0; i < holes.length; i++) {
    for (let j = 0; j < holes[i]; j++) result.push(i + min);
  }
  return result;
}

console.log(pigeonholeSort([8, 3, 2, 7, 4, 6, 8]));
module.exports = { pigeonholeSort };
