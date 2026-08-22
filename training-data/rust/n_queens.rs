use std::collections::HashSet;

fn solve_n_queens(n: i32) -> Vec<Vec<i32>> {
    let mut solutions = vec![];
    let mut columns = HashSet::new();
    let mut diagonals = HashSet::new();
    let mut anti_diagonals = HashSet::new();
    let mut board = vec![-1; n as usize];

    fn backtrack(
        row: i32,
        n: i32,
        board: &mut Vec<i32>,
        columns: &mut HashSet<i32>,
        diagonals: &mut HashSet<i32>,
        anti_diagonals: &mut HashSet<i32>,
        solutions: &mut Vec<Vec<i32>>,
    ) {
        if row == n {
            solutions.push(board.clone());
            return;
        }
        for col in 0..n {
            if columns.contains(&col) || diagonals.contains(&(row - col)) || anti_diagonals.contains(&(row + col)) {
                continue;
            }
            columns.insert(col);
            diagonals.insert(row - col);
            anti_diagonals.insert(row + col);
            board[row as usize] = col;
            backtrack(row + 1, n, board, columns, diagonals, anti_diagonals, solutions);
            columns.remove(&col);
            diagonals.remove(&(row - col));
            anti_diagonals.remove(&(row + col));
        }
    }

    backtrack(0, n, &mut board, &mut columns, &mut diagonals, &mut anti_diagonals, &mut solutions);
    solutions
}

fn main() {
    println!("{}", solve_n_queens(6).len());
}
