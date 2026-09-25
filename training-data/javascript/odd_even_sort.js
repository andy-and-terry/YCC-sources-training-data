function oddEvenSort(items) {
  const a = [...items];
  let sorted = false;
  while (!sorted) {
    sorted = true;
    for (const start of [1, 0]) {
      for (let i = start; i < a.length - 1; i += 2) {
        if (a[i] > a[i + 1]) {
          [a[i], a[i + 1]] = [a[i + 1], a[i]];
          sorted = false;
        }
      }
    }
  }
  return a;
}

console.log(oddEvenSort([34, 2, 10, -9, 5, 3, 1]));
module.exports = { oddEvenSort };
