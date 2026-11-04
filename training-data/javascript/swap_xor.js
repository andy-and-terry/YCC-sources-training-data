function swapXor(arr, i, j) {
  if (i === j) return arr; // XOR swap would zero the element
  arr[i] ^= arr[j];
  arr[j] ^= arr[i];
  arr[i] ^= arr[j];
  return arr;
}

console.log(swapXor([12, 34, 56], 0, 2)); // [56, 34, 12]
const [a, b] = [1, 2];
console.log([b, a]); // destructuring swap is clearer
