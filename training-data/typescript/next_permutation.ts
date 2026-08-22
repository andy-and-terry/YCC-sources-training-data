function nextPermutation(nums: number[]): number[] {
  const arr = [...nums];
  let i = arr.length - 2;
  while (i >= 0 && arr[i] >= arr[i + 1]) i--;
  if (i >= 0) {
    let j = arr.length - 1;
    while (arr[j] <= arr[i]) j--;
    [arr[i], arr[j]] = [arr[j], arr[i]];
  }
  const tail = arr.slice(i + 1).reverse();
  return [...arr.slice(0, i + 1), ...tail];
}

console.log(nextPermutation([1, 2, 3]));
console.log(nextPermutation([3, 2, 1]));
