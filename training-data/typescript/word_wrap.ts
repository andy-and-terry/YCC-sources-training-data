/** Minimum-raggedness word wrap (sum of squared trailing spaces), via DP. */
export function wrapOptimal(words: string[], width: number): string[] {
  const n = words.length;
  const cost = new Array<number>(n + 1).fill(Infinity);
  const breakAt = new Array<number>(n + 1).fill(n);
  cost[n] = 0;
  for (let i = n - 1; i >= 0; i--) {
    let len = -1;
    for (let j = i; j < n; j++) {
      len += words[j].length + 1;
      if (len > width) break;
      const slack = j === n - 1 ? 0 : (width - len) ** 2;
      if (slack + cost[j + 1] < cost[i]) {
        cost[i] = slack + cost[j + 1];
        breakAt[i] = j + 1;
      }
    }
  }
  const lines: string[] = [];
  for (let i = 0; i < n; i = breakAt[i]) lines.push(words.slice(i, breakAt[i]).join(" "));
  return lines;
}

const text = "aaa bb cc ddddd the quick brown fox jumps over the lazy dog";
for (const ln of wrapOptimal(text.split(" "), 16)) console.log(`|${ln.padEnd(16)}|`);
