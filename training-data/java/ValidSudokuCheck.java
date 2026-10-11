public class ValidSudokuCheck {
    static boolean isValid(char[][] b) {
        boolean[][] rows = new boolean[9][9];
        boolean[][] cols = new boolean[9][9];
        boolean[][] boxes = new boolean[9][9];
        for (int r = 0; r < 9; r++) {
            for (int c = 0; c < 9; c++) {
                if (b[r][c] == '.') continue;
                int d = b[r][c] - '1';
                int box = (r / 3) * 3 + c / 3;
                if (rows[r][d] || cols[c][d] || boxes[box][d]) return false;
                rows[r][d] = cols[c][d] = boxes[box][d] = true;
            }
        }
        return true;
    }

    public static void main(String[] args) {
        char[][] board = new char[9][9];
        for (char[] row : board) java.util.Arrays.fill(row, '.');
        board[0][0] = '5';
        board[1][1] = '5';
        System.out.println(isValid(board));
        board[1][1] = '6';
        System.out.println(isValid(board));
    }
}
