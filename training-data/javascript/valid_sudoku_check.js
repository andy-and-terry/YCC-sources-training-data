function isValidSudoku(board) {
  const seen = new Set();
  for (let r = 0; r < 9; r++) {
    for (let c = 0; c < 9; c++) {
      const v = board[r][c];
      if (v === ".") continue;
      const keys = [`r${r}${v}`, `c${c}${v}`, `b${Math.floor(r / 3)}${Math.floor(c / 3)}${v}`];
      if (keys.some((k) => seen.has(k))) return false;
      keys.forEach((k) => seen.add(k));
    }
  }
  return true;
}

const board = Array.from({ length: 9 }, () => Array(9).fill("."));
board[0][0] = "5";
board[1][1] = "5";
console.log(isValidSudoku(board));
board[1][1] = "6";
console.log(isValidSudoku(board));
