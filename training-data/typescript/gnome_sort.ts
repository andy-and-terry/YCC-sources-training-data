export function gnomeSort<T>(items: readonly T[], less: (a: T, b: T) => boolean = (a, b) => a < b): T[] {
  const a = [...items];
  let i = 0;
  while (i < a.length) {
    if (i === 0 || !less(a[i], a[i - 1])) i++;
    else {
      [a[i - 1], a[i]] = [a[i], a[i - 1]];
      i--;
    }
  }
  return a;
}

console.log(gnomeSort([34, 2, 10, -9, 7]));
console.log(gnomeSort(["delta", "alpha", "charlie", "bravo"]));
