import java.util.ArrayDeque;
import java.util.Deque;

public class FloodFill {
    public static int fill(char[][] grid, int sr, int sc, char color) {
        char target = grid[sr][sc];
        if (target == color) return 0;
        Deque<int[]> queue = new ArrayDeque<>();
        queue.add(new int[] {sr, sc});
        grid[sr][sc] = color;
        int count = 1;
        int[][] dirs = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};
        while (!queue.isEmpty()) {
            int[] p = queue.poll();
            for (int[] d : dirs) {
                int r = p[0] + d[0], c = p[1] + d[1];
                if (r >= 0 && r < grid.length && c >= 0 && c < grid[0].length && grid[r][c] == target) {
                    grid[r][c] = color;
                    count++;
                    queue.add(new int[] {r, c});
                }
            }
        }
        return count;
    }

    public static void main(String[] args) {
        char[][] img = {"..##.".toCharArray(), ".#..#".toCharArray(), ".#..#".toCharArray(), "..##.".toCharArray()};
        System.out.println("filled " + fill(img, 1, 2, 'o'));
        for (char[] row : img) System.out.println(new String(row));
    }
}
