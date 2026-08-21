export function binarySearch(items: number[], target: number): number {
  let low = 0;
  let high = items.length - 1;

  while (low <= high) {
    const mid = Math.floor((low + high) / 2);
    if (items[mid] === target) return mid;
    if (items[mid] < target) low = mid + 1;
    else high = mid - 1;
  }

  return -1;
}

console.log(binarySearch([1, 3, 5, 7, 9, 11], 7));
