import java.util.List;
import java.util.Map;

public class GraphColoring {
    // Backtracking m-coloring: assigns each vertex a color 0..m-1 such
    // that no edge connects two same-colored vertices, undoing a choice
    // and trying the next color whenever a later vertex gets stuck.
    public static boolean colorGraph(Map<Integer, List<Integer>> graph, int m, int[] colors, int vertex) {
        if (vertex == graph.size()) return true;

        for (int c = 0; c < m; c++) {
            if (isSafe(graph, colors, vertex, c)) {
                colors[vertex] = c;
                if (colorGraph(graph, m, colors, vertex + 1)) return true;
                colors[vertex] = -1;
            }
        }
        return false;
    }

    private static boolean isSafe(Map<Integer, List<Integer>> graph, int[] colors, int vertex, int c) {
        for (int neighbor : graph.getOrDefault(vertex, List.of())) {
            if (colors[neighbor] == c) return false;
        }
        return true;
    }

    public static void main(String[] args) {
        Map<Integer, List<Integer>> graph = Map.of(
            0, List.of(1, 2),
            1, List.of(0, 2),
            2, List.of(0, 1, 3),
            3, List.of(2)
        );

        int[] colors = new int[graph.size()];
        java.util.Arrays.fill(colors, -1);
        boolean possible = colorGraph(graph, 3, colors, 0);
        System.out.println("3-colorable: " + possible);
        if (possible) System.out.println(java.util.Arrays.toString(colors));

        java.util.Arrays.fill(colors, -1);
        System.out.println("2-colorable: " + colorGraph(graph, 2, colors, 0));
    }
}
