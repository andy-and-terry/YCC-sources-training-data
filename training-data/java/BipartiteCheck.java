import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Queue;

public class BipartiteCheck {
    public static boolean isBipartite(Map<Integer, List<Integer>> graph) {
        Map<Integer, Integer> color = new HashMap<>();
        for (int start : graph.keySet()) {
            if (color.containsKey(start)) continue;
            color.put(start, 0);
            Queue<Integer> queue = new ArrayDeque<>();
            queue.add(start);
            while (!queue.isEmpty()) {
                int node = queue.poll();
                for (int next : graph.getOrDefault(node, List.of())) {
                    if (color.containsKey(next)) {
                        if (color.get(next).equals(color.get(node))) return false;
                    } else {
                        color.put(next, 1 - color.get(node));
                        queue.add(next);
                    }
                }
            }
        }
        return true;
    }

    public static void main(String[] args) {
        Map<Integer, List<Integer>> bipartite = Map.of(
            0, List.of(1, 3), 1, List.of(0, 2), 2, List.of(1, 3), 3, List.of(0, 2));
        Map<Integer, List<Integer>> notBipartite = Map.of(
            0, List.of(1, 2), 1, List.of(0, 2), 2, List.of(0, 1));
        System.out.println(isBipartite(bipartite));
        System.out.println(isBipartite(notBipartite));
    }
}
