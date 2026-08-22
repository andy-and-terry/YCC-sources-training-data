function binarySearchExact(items: number[], target: number): number {
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

function lowerBound(items: number[], target: number): number {
  let low = 0;
  let high = items.length;
  while (low < high) {
    const mid = Math.floor((low + high) / 2);
    if (items[mid] < target) low = mid + 1;
    else high = mid;
  }
  return low;
}

function upperBound(items: number[], target: number): number {
  let low = 0;
  let high = items.length;
  while (low < high) {
    const mid = Math.floor((low + high) / 2);
    if (items[mid] <= target) low = mid + 1;
    else high = mid;
  }
  return low;
}

const data = [1, 2, 2, 2, 3, 5, 8];
console.log(binarySearchExact(data, 5));
console.log(lowerBound(data, 2), upperBound(data, 2));
