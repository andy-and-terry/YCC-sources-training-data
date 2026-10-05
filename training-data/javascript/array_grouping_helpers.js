const chunk = (arr, size) =>
  Array.from({ length: Math.ceil(arr.length / size) }, (_, i) => arr.slice(i * size, i * size + size));

const zip = (...arrays) =>
  Array.from({ length: Math.min(...arrays.map((a) => a.length)) }, (_, i) => arrays.map((a) => a[i]));

const countBy = (arr, fn) =>
  arr.reduce((acc, x) => {
    const k = fn(x);
    acc[k] = (acc[k] || 0) + 1;
    return acc;
  }, {});

const partition = (arr, pred) =>
  arr.reduce(([yes, no], x) => (pred(x) ? [[...yes, x], no] : [yes, [...no, x]]), [[], []]);

console.log(chunk([1, 2, 3, 4, 5], 2));
console.log(zip([1, 2, 3], ["a", "b", "c"], [true, false, true]));
console.log(countBy(["apple", "avocado", "banana"], (w) => w[0]));
console.log(partition([1, 2, 3, 4, 5, 6], (n) => n % 2 === 0));
