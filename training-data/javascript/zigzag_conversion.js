function convert(s, numRows) {
  if (numRows === 1 || numRows >= s.length) return s;
  const rows = Array.from({ length: numRows }, () => "");
  let row = 0;
  let dir = 1;
  for (const ch of s) {
    rows[row] += ch;
    if (row === 0) dir = 1;
    else if (row === numRows - 1) dir = -1;
    row += dir;
  }
  return rows.join("");
}

console.log(convert("PAYPALISHIRING", 3));
console.log(convert("PAYPALISHIRING", 4));
console.log(convert("AB", 1));
