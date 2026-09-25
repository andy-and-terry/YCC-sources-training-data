export function* balanced(n: number, prefix = "", open = 0, close = 0): Generator<string> {
  if (prefix.length === 2 * n) {
    yield prefix;
    return;
  }
  if (open < n) yield* balanced(n, prefix + "(", open + 1, close);
  if (close < open) yield* balanced(n, prefix + ")", open, close + 1);
}

console.log([...balanced(3)]);
let count = 0;
for (const _ of balanced(7)) count++;
console.log("n=7:", count);
