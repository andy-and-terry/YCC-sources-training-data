const wordCounts = new Map();
for (const word of ['a', 'b', 'a', 'c', 'b', 'a']) {
  wordCounts.set(word, (wordCounts.get(word) || 0) + 1);
}
console.log([...wordCounts.entries()]);

// Sort a Map's entries by value, descending.
const sorted = [...wordCounts.entries()].sort((a, b) => b[1] - a[1]);
console.log(sorted);

const uniqueTags = new Set(['red', 'green', 'red', 'blue']);
const otherTags = new Set(['green', 'yellow']);

const union = new Set([...uniqueTags, ...otherTags]);
const intersection = new Set([...uniqueTags].filter((t) => otherTags.has(t)));
const difference = new Set([...uniqueTags].filter((t) => !otherTags.has(t)));

console.log('union:', [...union]);
console.log('intersection:', [...intersection]);
console.log('difference:', [...difference]);

module.exports = { wordCounts };
