/** Sorts in place using the minimum possible number of writes. Returns the write count. */
export function cycleSort(a: number[]): number {
  let writes = 0;
  const position = (item: number, start: number): number => {
    let pos = start;
    for (let i = start + 1; i < a.length; i++) if (a[i] < item) pos++;
    return pos;
  };
  for (let start = 0; start < a.length - 1; start++) {
    let item = a[start];
    let pos = position(item, start);
    if (pos === start) continue;
    while (item === a[pos]) pos++;
    [a[pos], item] = [item, a[pos]];
    writes++;
    while (pos !== start) {
      pos = position(item, start);
      while (item === a[pos]) pos++;
      [a[pos], item] = [item, a[pos]];
      writes++;
    }
  }
  return writes;
}

const data = [1, 8, 3, 9, 10, 10, 2, 4];
const writes = cycleSort(data);
console.log(data, "writes:", writes);
