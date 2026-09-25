function cocktailShakerSort(items) {
  const a = [...items];
  let lo = 0;
  let hi = a.length - 1;
  let swapped = true;
  while (swapped) {
    swapped = false;
    for (let i = lo; i < hi; i++) {
      if (a[i] > a[i + 1]) {
        [a[i], a[i + 1]] = [a[i + 1], a[i]];
        swapped = true;
      }
    }
    hi--;
    for (let i = hi; i > lo; i--) {
      if (a[i - 1] > a[i]) {
        [a[i - 1], a[i]] = [a[i], a[i - 1]];
        swapped = true;
      }
    }
    lo++;
  }
  return a;
}

console.log(cocktailShakerSort([5, 1, 4, 2, 8, 0, 2]));
module.exports = { cocktailShakerSort };
