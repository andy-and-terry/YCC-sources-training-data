function merge<T>(left: T[], right: T[], compare: (a: T, b: T) => number): T[] {
  const result: T[] = [];
  let i = 0;
  let j = 0;
  while (i < left.length && j < right.length) {
    if (compare(left[i], right[j]) <= 0) result.push(left[i++]);
    else result.push(right[j++]);
  }
  return result.concat(left.slice(i), right.slice(j));
}

function mergeSort<T>(arr: T[], compare: (a: T, b: T) => number = (a, b) => (a < b ? -1 : a > b ? 1 : 0)): T[] {
  if (arr.length <= 1) return arr;
  const mid = Math.floor(arr.length / 2);
  const left = mergeSort(arr.slice(0, mid), compare);
  const right = mergeSort(arr.slice(mid), compare);
  return merge(left, right, compare);
}

console.log(mergeSort([5, 3, 8, 4, 2, 7, 1, 10]));
console.log(mergeSort(["banana", "apple", "cherry"]));
console.log(mergeSort([{ age: 30 }, { age: 20 }, { age: 25 }], (a, b) => a.age - b.age));
