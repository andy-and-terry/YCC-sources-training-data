public class MagicSquareOdd {
    static int[][] magicSquare(int n) {
        int[][] sq = new int[n][n];
        int r = 0, c = n / 2;
        for (int k = 1; k <= n * n; k++) {
            sq[r][c] = k;
            int nr = (r - 1 + n) % n, nc = (c + 1) % n;
            if (sq[nr][nc] != 0) {
                nr = (r + 1) % n;
                nc = c;
            }
            r = nr;
            c = nc;
        }
        return sq;
    }

    public static void main(String[] args) {
        for (int[] row : magicSquare(5)) {
            StringBuilder sb = new StringBuilder();
            for (int v : row) sb.append(String.format("%3d", v));
            System.out.println(sb);
        }
    }
}
