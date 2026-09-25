function partition3(a, pivot) {
  let lo = 0, mid = 0, hi = a.length - 1;
  while (mid <= hi) {
    if (a[mid] < pivot) [a[lo++], a[mid++]] = [a[mid], a[lo]];
    else if (a[mid] > pivot) [a[mid], a[hi--]] = [a[hi], a[mid]];
    else mid++;
  }
  return [lo, hi];
}

const colors = [2, 0, 2, 1, 1, 0, 1, 2, 0];
console.log(partition3(colors, 1), colors);
module.exports = { partition3 };
