function quickselect(values: number[], k: number): number {
  const arr = [...values];
  let lo = 0;
  let hi = arr.length - 1;
  while (lo <= hi) {
    const pivot = arr[hi];
    let store = lo;
    for (let i = lo; i < hi; i++) {
      if (arr[i] < pivot) {
        [arr[i], arr[store]] = [arr[store], arr[i]];
        store++;
      }
    }
    [arr[store], arr[hi]] = [arr[hi], arr[store]];
    if (store === k) return arr[store];
    if (store < k) lo = store + 1;
    else hi = store - 1;
  }
  throw new RangeError("k out of range");
}

const data = [7, 10, 4, 3, 20, 15];
console.log(quickselect(data, 2));
console.log(quickselect(data, 0));
