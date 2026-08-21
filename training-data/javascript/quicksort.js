function quicksort(items) {
  if (items.length <= 1) return items;
  const pivot = items[Math.floor(items.length / 2)];
  const left = items.filter((x) => x < pivot);
  const mid = items.filter((x) => x === pivot);
  const right = items.filter((x) => x > pivot);
  return [...quicksort(left), ...mid, ...quicksort(right)];
}

console.log(quicksort([5, 3, 8, 1, 9, 2]));

module.exports = { quicksort };
