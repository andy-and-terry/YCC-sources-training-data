// Sorts in place with the minimum number of memory writes.
function cycleSort(a) {
  let writes = 0;
  for (let start = 0; start < a.length - 1; start++) {
    let item = a[start];
    let pos = start;
    for (let i = start + 1; i < a.length; i++) if (a[i] < item) pos++;
    if (pos === start) continue;
    while (item === a[pos]) pos++;
    [a[pos], item] = [item, a[pos]];
    writes++;
    while (pos !== start) {
      pos = start;
      for (let i = start + 1; i < a.length; i++) if (a[i] < item) pos++;
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
module.exports = { cycleSort };
