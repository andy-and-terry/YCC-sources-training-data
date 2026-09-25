function flip(a, k) {
  let i = 0;
  while (i < k) {
    [a[i], a[k]] = [a[k], a[i]];
    i++;
    k--;
  }
}

function pancakeSort(items) {
  const a = [...items];
  for (let size = a.length; size > 1; size--) {
    let maxIdx = 0;
    for (let i = 1; i < size; i++) if (a[i] > a[maxIdx]) maxIdx = i;
    if (maxIdx !== size - 1) {
      flip(a, maxIdx);
      flip(a, size - 1);
    }
  }
  return a;
}

console.log(pancakeSort([23, 10, 20, 11, 12, 6, 7]));
module.exports = { pancakeSort };
