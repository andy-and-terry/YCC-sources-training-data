function fullJustify(words, width) {
  const lines = [];
  let i = 0;
  while (i < words.length) {
    let j = i, len = 0;
    while (j < words.length && len + words[j].length + (j - i) <= width) len += words[j++].length;
    const gaps = j - i - 1;
    let line;
    if (j === words.length || gaps === 0) {
      line = words.slice(i, j).join(" ").padEnd(width);
    } else {
      const spaces = Math.floor((width - len) / gaps);
      const extra = (width - len) % gaps;
      line = "";
      for (let k = i; k < j - 1; k++) line += words[k] + " ".repeat(spaces + (k - i < extra ? 1 : 0));
      line += words[j - 1];
    }
    lines.push(line);
    i = j;
  }
  return lines;
}

const words = "This is an example of text justification done greedily line by line".split(" ");
for (const l of fullJustify(words, 20)) console.log(`[${l}]`);
module.exports = { fullJustify };
