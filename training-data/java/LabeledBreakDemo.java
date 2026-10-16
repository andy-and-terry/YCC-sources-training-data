public class LabeledBreakDemo {
    public static void main(String[] args) {
        int[][] grid = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
        int target = 6;
        int foundRow = -1, foundCol = -1;

        search:
        for (int r = 0; r < grid.length; r++) {
            for (int c = 0; c < grid[r].length; c++) {
                if (grid[r][c] == target) {
                    foundRow = r;
                    foundCol = c;
                    break search;
                }
            }
        }
        System.out.println("found at " + foundRow + "," + foundCol);

        int sum = 0;
        outer:
        for (int[] row : grid) {
            for (int v : row) {
                if (v % 2 == 0) continue outer;
                sum += v;
            }
        }
        System.out.println("sum before first even per row: " + sum);
    }
}
