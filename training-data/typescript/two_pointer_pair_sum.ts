function pairWithSum(sorted: number[], target: number): [number, number] | null {
  let left = 0;
  let right = sorted.length - 1;
  while (left < right) {
    const sum = sorted[left] + sorted[right];
    if (sum === target) return [sorted[left], sorted[right]];
    if (sum < target) left++;
    else right--;
  }
  return null;
}

const data = [1, 3, 4, 6, 8, 11];
console.log(pairWithSum(data, 10));
console.log(pairWithSum(data, 100));
