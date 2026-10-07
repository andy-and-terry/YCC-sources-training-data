// ES2023 non-mutating array methods: toSorted, toReversed, toSpliced, with.
const nums = [3, 1, 2];
const sorted = nums.toSorted((a, b) => a - b);
const reversed = nums.toReversed();
const spliced = nums.toSpliced(1, 1, 'x', 'y');
const replaced = nums.with(0, 99);

console.log(nums);
console.log(sorted, reversed, spliced, replaced);

console.log([1, 2, 3, 4].findLast((n) => n % 2 === 1));
console.log([1, 2, 3, 4].findLastIndex((n) => n > 5));
console.log([[1, 2], [3]].flatMap((x) => x));
console.log(Array.from({ length: 4 }, (_, i) => i * i));
console.log(Object.groupBy([1, 2, 3, 4, 5], (n) => (n % 2 ? 'odd' : 'even')));
