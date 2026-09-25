function gnomeSort(items) {
  const a = [...items];
  let i = 0;
  while (i < a.length) {
    if (i === 0 || a[i - 1] <= a[i]) {
      i++;
    } else {
      [a[i - 1], a[i]] = [a[i], a[i - 1]];
      i--;
    }
  }
  return a;
}

console.log(gnomeSort([34, 2, 10, -9, 7]));
module.exports = { gnomeSort };
