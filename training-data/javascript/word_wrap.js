function wrap(text, width) {
  const lines = [];
  let line = "";
  for (let word of text.split(/\s+/)) {
    while (word.length > width) {
      if (line) { lines.push(line); line = ""; }
      lines.push(word.slice(0, width));
      word = word.slice(width);
    }
    if (!line) line = word;
    else if (line.length + 1 + word.length <= width) line += " " + word;
    else { lines.push(line); line = word; }
  }
  if (line) lines.push(line);
  return lines;
}

const text = "The quick brown fox jumps over the lazy dog and keeps running supercalifragilistically";
for (const ln of wrap(text, 16)) console.log(`|${ln.padEnd(16)}|`);
module.exports = { wrap };
