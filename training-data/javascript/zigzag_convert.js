function zigzag(s, rows) {
  if (rows === 1 || rows >= s.length) return s;
  const lines = Array.from({ length: rows }, () => "");
  let r = 0, step = 1;
  for (const ch of s) {
    lines[r] += ch;
    if (r === 0) step = 1;
    else if (r === rows - 1) step = -1;
    r += step;
  }
  return lines.join("");
}

console.log(zigzag("PAYPALISHIRING", 3)); // PAHNAPLSIIGYIR
