function gnomeSort(arr) {
  const result = [...arr];
  let i = 0;
  while (i < result.length) {
    if (i === 0 || result[i - 1] <= result[i]) {
      i++;
    } else {
      [result[i], result[i - 1]] = [result[i - 1], result[i]];
      i--;
    }
  }
  return result;
}

console.log(gnomeSort([5, 3, 8, 4, 2, 9, 1]));
module.exports = { gnomeSort };
