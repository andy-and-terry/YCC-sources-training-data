import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class MazeSolverBfs {
    public static List<int[]> solve(int[][] maze, int[] start, int[] end) {
        int rows = maze.length;
        int cols = maze[0].length;
        Deque<Object[]> queue = new ArrayDeque<>();
        List<int[]> initialPath = new ArrayList<>();
        initialPath.add(start);
        queue.add(new Object[] {start, initialPath});
        Set<String> visited = new HashSet<>();
        visited.add(start[0] + "," + start[1]);

        int[][] directions = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};

        while (!queue.isEmpty()) {
            Object[] entry = queue.poll();
            int[] pos = (int[]) entry[0];
            @SuppressWarnings("unchecked")
            List<int[]> path = (List<int[]>) entry[1];
            if (pos[0] == end[0] && pos[1] == end[1]) return path;

            for (int[] dir : directions) {
                int nr = pos[0] + dir[0];
                int nc = pos[1] + dir[1];
                String key = nr + "," + nc;
                if (nr >= 0 && nr < rows && nc >= 0 && nc < cols && maze[nr][nc] == 0 && !visited.contains(key)) {
                    visited.add(key);
                    List<int[]> newPath = new ArrayList<>(path);
                    newPath.add(new int[] {nr, nc});
                    queue.add(new Object[] {new int[] {nr, nc}, newPath});
                }
            }
        }
        return null;
    }

    public static void main(String[] args) {
        int[][] maze = {
            {0, 1, 0, 0},
            {0, 1, 0, 1},
            {0, 0, 0, 1},
            {1, 1, 0, 0},
        };
        List<int[]> path = solve(maze, new int[] {0, 0}, new int[] {3, 3});
        for (int[] step : path) System.out.print("(" + step[0] + "," + step[1] + ") ");
        System.out.println();
    }
}
