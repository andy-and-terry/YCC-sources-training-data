export function cocktailShakerSort<T>(items: readonly T[], cmp: (a: T, b: T) => number): T[] {
  const a = [...items];
  let lo = 0;
  let hi = a.length - 1;
  let swapped = true;
  const swap = (i: number, j: number): void => {
    [a[i], a[j]] = [a[j], a[i]];
    swapped = true;
  };
  while (swapped) {
    swapped = false;
    for (let i = lo; i < hi; i++) if (cmp(a[i], a[i + 1]) > 0) swap(i, i + 1);
    hi--;
    for (let i = hi; i > lo; i--) if (cmp(a[i - 1], a[i]) > 0) swap(i - 1, i);
    lo++;
  }
  return a;
}

console.log(cocktailShakerSort([5, 1, 4, 2, 8, 0, 2], (x, y) => x - y));
console.log(cocktailShakerSort(["pear", "apple", "fig"], (x, y) => x.localeCompare(y)));
