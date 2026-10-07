export function fullJustify(words: readonly string[], width: number): string[] {
  const lines: string[] = [];
  let i = 0;
  while (i < words.length) {
    let j = i, len = 0;
    while (j < words.length && len + words[j].length + (j - i) <= width) len += words[j++].length;
    const line = words.slice(i, j);
    const gaps = line.length - 1;
    if (j === words.length || gaps === 0) {
      lines.push(line.join(" ").padEnd(width));
    } else {
      const spaces = Math.floor((width - len) / gaps);
      const extra = (width - len) % gaps;
      lines.push(line.reduce((acc, w, k) => (k === 0 ? w : acc + " ".repeat(spaces + (k <= extra ? 1 : 0)) + w), ""));
    }
    i = j;
  }
  return lines;
}

const words = "This is an example of text justification done greedily line by line".split(" ");
for (const l of fullJustify(words, 20)) console.log(`[${l}]`);
