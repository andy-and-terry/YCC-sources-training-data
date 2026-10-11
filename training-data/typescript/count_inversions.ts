function countInversions(input: number[]): number {
  const arr = [...input];
  const buffer = new Array<number>(arr.length);

  const sort = (lo: number, hi: number): number => {
    if (hi - lo < 2) return 0;
    const mid = (lo + hi) >> 1;
    let count = sort(lo, mid) + sort(mid, hi);
    let i = lo;
    let j = mid;
    let k = lo;
    while (i < mid && j < hi) {
      if (arr[i] <= arr[j]) buffer[k++] = arr[i++];
      else {
        buffer[k++] = arr[j++];
        count += mid - i;
      }
    }
    while (i < mid) buffer[k++] = arr[i++];
    while (j < hi) buffer[k++] = arr[j++];
    for (let x = lo; x < hi; x++) arr[x] = buffer[x];
    return count;
  };

  return sort(0, arr.length);
}

console.log(countInversions([2, 4, 1, 3, 5]));
console.log(countInversions([5, 4, 3, 2, 1]));
