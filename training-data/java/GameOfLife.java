public class GameOfLife {
    /** In-place update using bit 1 as the next state. */
    public static void step(int[][] board) {
        int h = board.length, w = board[0].length;
        for (int r = 0; r < h; r++) {
            for (int c = 0; c < w; c++) {
                int n = 0;
                for (int dr = -1; dr <= 1; dr++)
                    for (int dc = -1; dc <= 1; dc++) {
                        if (dr == 0 && dc == 0) continue;
                        int rr = r + dr, cc = c + dc;
                        if (rr >= 0 && rr < h && cc >= 0 && cc < w) n += board[rr][cc] & 1;
                    }
                if ((board[r][c] & 1) == 1 ? (n == 2 || n == 3) : n == 3) board[r][c] |= 2;
            }
        }
        for (int[] row : board) for (int c = 0; c < w; c++) row[c] >>= 1;
    }

    static void print(int[][] b) {
        for (int[] row : b) {
            StringBuilder sb = new StringBuilder();
            for (int v : row) sb.append(v == 1 ? '#' : '.');
            System.out.println(sb);
        }
        System.out.println();
    }

    public static void main(String[] args) {
        int[][] b = new int[6][6];
        int[][] glider = {{0, 1}, {1, 2}, {2, 0}, {2, 1}, {2, 2}};
        for (int[] p : glider) b[p[0]][p[1]] = 1;
        for (int gen = 0; gen < 3; gen++) {
            print(b);
            step(b);
        }
    }
}
