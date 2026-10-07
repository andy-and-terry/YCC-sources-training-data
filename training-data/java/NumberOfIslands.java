public class NumberOfIslands {
    public static int numIslands(char[][] grid) {
        int rows = grid.length;
        if (rows == 0) return 0;
        int cols = grid[0].length;

        int count = 0;
        for (int r = 0; r < rows; r++) {
            for (int c = 0; c < cols; c++) {
                if (grid[r][c] == '1') {
                    count++;
                    flood(grid, r, c, rows, cols);
                }
            }
        }
        return count;
    }

    private static void flood(char[][] grid, int r, int c, int rows, int cols) {
        if (r < 0 || r >= rows || c < 0 || c >= cols || grid[r][c] != '1') return;
        grid[r][c] = '0';
        flood(grid, r + 1, c, rows, cols);
        flood(grid, r - 1, c, rows, cols);
        flood(grid, r, c + 1, rows, cols);
        flood(grid, r, c - 1, rows, cols);
    }

    public static void main(String[] args) {
        char[][] grid = {
            {'1', '1', '0', '0', '0'},
            {'1', '1', '0', '0', '0'},
            {'0', '0', '1', '0', '0'},
            {'0', '0', '0', '1', '1'}
        };
        System.out.println("islands: " + numIslands(grid));
    }
}
