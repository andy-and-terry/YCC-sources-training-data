const nums = [10, 9, 1, 100, 25];
console.log([...nums].sort());
console.log([...nums].sort((a, b) => a - b));
console.log(nums.toSorted((a, b) => b - a), nums);

const nested = [1, [2, [3, [4]]]];
console.log(nested.flat(Infinity));
console.log(['a b', 'c d'].flatMap((s) => s.split(' ')));

console.log(nums.findLast((n) => n < 20), nums.findLastIndex((n) => n > 50));
console.log(nums.with(0, -1), nums.toReversed());
console.log(Array.from({ length: 5 }, (_, i) => i * i));
console.log(nums.includes(25), nums.some((n) => n > 99), nums.every((n) => n > 0));
