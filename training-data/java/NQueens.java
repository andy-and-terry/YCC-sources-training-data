import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class NQueens {
    public static List<int[]> solve(int n) {
        List<int[]> solutions = new ArrayList<>();
        Set<Integer> columns = new HashSet<>();
        Set<Integer> diagonals = new HashSet<>();
        Set<Integer> antiDiagonals = new HashSet<>();
        int[] board = new int[n];

        backtrack(0, n, board, columns, diagonals, antiDiagonals, solutions);
        return solutions;
    }

    private static void backtrack(int row, int n, int[] board, Set<Integer> columns,
                                   Set<Integer> diagonals, Set<Integer> antiDiagonals, List<int[]> solutions) {
        if (row == n) {
            solutions.add(board.clone());
            return;
        }
        for (int col = 0; col < n; col++) {
            if (columns.contains(col) || diagonals.contains(row - col) || antiDiagonals.contains(row + col)) continue;
            columns.add(col);
            diagonals.add(row - col);
            antiDiagonals.add(row + col);
            board[row] = col;
            backtrack(row + 1, n, board, columns, diagonals, antiDiagonals, solutions);
            columns.remove(col);
            diagonals.remove(row - col);
            antiDiagonals.remove(row + col);
        }
    }

    public static void main(String[] args) {
        System.out.println(solve(6).size());
    }
}
