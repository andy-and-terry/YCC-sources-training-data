function solveNQueens(n: number): number[][] {
  const solutions: number[][] = [];
  const columns = new Set<number>();
  const diagonals = new Set<number>();
  const antiDiagonals = new Set<number>();
  const board = new Array(n).fill(-1);

  function backtrack(row: number): void {
    if (row === n) {
      solutions.push([...board]);
      return;
    }
    for (let col = 0; col < n; col++) {
      if (columns.has(col) || diagonals.has(row - col) || antiDiagonals.has(row + col)) continue;
      columns.add(col);
      diagonals.add(row - col);
      antiDiagonals.add(row + col);
      board[row] = col;
      backtrack(row + 1);
      columns.delete(col);
      diagonals.delete(row - col);
      antiDiagonals.delete(row + col);
    }
  }

  backtrack(0);
  return solutions;
}

console.log(solveNQueens(6).length);
