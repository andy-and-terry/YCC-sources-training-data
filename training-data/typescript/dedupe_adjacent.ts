// Generic adjacent de-duplication.
function dedupe<T>(xs: T[]): T[] {
  return xs.filter((x, i) => i === 0 || x !== xs[i - 1]);
}
console.log(dedupe([..."aabbbcdd"]).join(""));
