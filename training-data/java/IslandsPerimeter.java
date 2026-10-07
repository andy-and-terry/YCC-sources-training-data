public class IslandsPerimeter {
    public static int perimeter(int[][] grid) {
        int per = 0;
        for (int r = 0; r < grid.length; r++) {
            for (int c = 0; c < grid[r].length; c++) {
                if (grid[r][c] == 0) continue;
                per += 4;
                if (r > 0 && grid[r - 1][c] == 1) per -= 2;
                if (c > 0 && grid[r][c - 1] == 1) per -= 2;
            }
        }
        return per;
    }

    public static void main(String[] args) {
        System.out.println(perimeter(new int[][] {{0, 1, 0, 0}, {1, 1, 1, 0}, {0, 1, 0, 0}, {1, 1, 0, 0}}));
    }
}
