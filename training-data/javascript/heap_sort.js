function heapSort(items) {
  const arr = [...items];
  const n = arr.length;

  function siftDown(start, end) {
    let root = start;
    while (2 * root + 1 <= end) {
      let child = 2 * root + 1;
      if (child + 1 <= end && arr[child] < arr[child + 1]) child++;
      if (arr[root] < arr[child]) {
        [arr[root], arr[child]] = [arr[child], arr[root]];
        root = child;
      } else {
        return;
      }
    }
  }

  for (let start = Math.floor(n / 2) - 1; start >= 0; start--) siftDown(start, n - 1);
  for (let end = n - 1; end > 0; end--) {
    [arr[0], arr[end]] = [arr[end], arr[0]];
    siftDown(0, end - 1);
  }
  return arr;
}

console.log(heapSort([5, 3, 8, 1, 9, 2]));
module.exports = { heapSort };
