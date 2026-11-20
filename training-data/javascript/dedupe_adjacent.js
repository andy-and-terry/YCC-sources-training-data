// Collapse consecutive duplicates.
const dedupe = (arr) => arr.filter((x, i) => i === 0 || x !== arr[i - 1]);
console.log(dedupe([..."aabbbcdd"]).join(""));
