import java.util.ArrayList;
import java.util.List;

public class RatInMaze {
    private static final char[] NAMES = {'D', 'L', 'R', 'U'};
    private static final int[][] DIRS = {{1, 0}, {0, -1}, {0, 1}, {-1, 0}};

    public static List<String> solve(int[][] maze) {
        List<String> paths = new ArrayList<>();
        if (maze[0][0] == 1) go(maze, 0, 0, new boolean[maze.length][maze.length], new StringBuilder(), paths);
        return paths;
    }

    private static void go(int[][] maze, int r, int c, boolean[][] seen, StringBuilder path, List<String> out) {
        int n = maze.length;
        if (r == n - 1 && c == n - 1) {
            out.add(path.toString());
            return;
        }
        seen[r][c] = true;
        for (int k = 0; k < 4; k++) {
            int nr = r + DIRS[k][0], nc = c + DIRS[k][1];
            if (nr >= 0 && nr < n && nc >= 0 && nc < n && maze[nr][nc] == 1 && !seen[nr][nc]) {
                path.append(NAMES[k]);
                go(maze, nr, nc, seen, path, out);
                path.deleteCharAt(path.length() - 1);
            }
        }
        seen[r][c] = false;
    }

    public static void main(String[] args) {
        System.out.println(solve(new int[][] {{1, 0, 0, 0}, {1, 1, 0, 1}, {1, 1, 0, 0}, {0, 1, 1, 1}}));
    }
}
