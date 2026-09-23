// ES2023 change-by-copy array methods: return a new array instead of
// mutating the receiver, unlike sort/reverse/splice/[]=.
const original = [3, 1, 4, 1, 5];

const sorted = original.toSorted((a, b) => a - b);
const reversed = original.toReversed();
const replaced = original.with(2, 99);
const spliced = original.toSpliced(1, 2, 100, 101);

console.log('original:', original);
console.log('sorted:', sorted);
console.log('reversed:', reversed);
console.log('with index 2 replaced:', replaced);
console.log('spliced copy:', spliced);
console.log('original unchanged:', original);

module.exports = { sorted, reversed, replaced, spliced };
