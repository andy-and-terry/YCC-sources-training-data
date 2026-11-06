// Maximum nesting depth of parentheses; -1 if the string is unbalanced.
function maxDepth(s) {
  let depth = 0, best = 0;
  for (const ch of s) {
    if (ch === "(") best = Math.max(best, ++depth);
    else if (ch === ")" && --depth < 0) return -1;
  }
  return depth === 0 ? best : -1;
}

console.log(maxDepth("(1+(2*(3)))"), maxDepth("(()"));
