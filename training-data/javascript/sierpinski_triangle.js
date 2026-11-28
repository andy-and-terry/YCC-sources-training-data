const n = 8;
for (let r = 0; r < n; r++) {
  let line = " ".repeat(n - r - 1);
  for (let c = 0; c <= r; c++) line += (r & c) === c ? "* " : "  ";
  console.log(line);
}
