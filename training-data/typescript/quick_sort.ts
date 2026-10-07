function quickSort<T>(arr: T[], compare: (a: T, b: T) => number = (a, b) => (a < b ? -1 : a > b ? 1 : 0)): T[] {
  if (arr.length <= 1) return arr;
  const [pivot, ...rest] = arr;
  const left = rest.filter((item) => compare(item, pivot) < 0);
  const right = rest.filter((item) => compare(item, pivot) >= 0);
  return [...quickSort(left, compare), pivot, ...quickSort(right, compare)];
}

console.log(quickSort([9, 1, 5, 3, 7, 2, 8]));
console.log(quickSort(["pear", "fig", "date", "apple"]));
console.log(quickSort([{ score: 3 }, { score: 1 }, { score: 2 }], (a, b) => a.score - b.score));
