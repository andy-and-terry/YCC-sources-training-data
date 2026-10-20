interface Dict<T> { [key: string]: T }
const wordCount: Dict<number> = {};
for (const w of "a b a c b a".split(" ")) wordCount[w] = (wordCount[w] ?? 0) + 1;
console.log(wordCount);
