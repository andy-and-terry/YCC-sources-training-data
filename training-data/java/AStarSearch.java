import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.ToIntFunction;

public class AStarSearch {
    public static List<String> aStar(Map<String, List<int[]>> graph, Map<String, Integer> index,
                                      String[] names, String start, String goal, ToIntFunction<String> heuristic) {
        List<Object[]> openSet = new ArrayList<>();
        openSet.add(new Object[] {heuristic.applyAsInt(start), 0, start});
        Map<String, String> cameFrom = new HashMap<>();
        Map<String, Integer> gScore = new HashMap<>();
        gScore.put(start, 0);

        while (!openSet.isEmpty()) {
            openSet.sort((a, b) -> (int) a[0] - (int) b[0]);
            Object[] current = openSet.remove(0);
            String node = (String) current[2];
            if (node.equals(goal)) {
                List<String> path = new ArrayList<>();
                String n = node;
                path.add(n);
                while (cameFrom.containsKey(n)) {
                    n = cameFrom.get(n);
                    path.add(n);
                }
                Collections.reverse(path);
                return path;
            }
            for (int[] edge : graph.getOrDefault(node, List.of())) {
                String neighbor = names[edge[0]];
                int weight = edge[1];
                int tentativeG = gScore.get(node) + weight;
                if (tentativeG < gScore.getOrDefault(neighbor, Integer.MAX_VALUE)) {
                    cameFrom.put(neighbor, node);
                    gScore.put(neighbor, tentativeG);
                    openSet.add(new Object[] {tentativeG + heuristic.applyAsInt(neighbor), tentativeG, neighbor});
                }
            }
        }
        return null;
    }

    public static void main(String[] args) {
        String[] names = {"A", "B", "C", "D"};
        Map<String, Integer> index = Map.of("A", 0, "B", 1, "C", 2, "D", 3);
        Map<String, List<int[]>> graph = new HashMap<>();
        graph.put("A", List.of(new int[] {1, 1}, new int[] {2, 4}));
        graph.put("B", List.of(new int[] {2, 1}, new int[] {3, 5}));
        graph.put("C", List.of(new int[] {3, 1}));
        graph.put("D", List.of());
        System.out.println(aStar(graph, index, names, "A", "D", n -> 0));
    }
}
