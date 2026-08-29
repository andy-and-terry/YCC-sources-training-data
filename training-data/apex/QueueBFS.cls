public class QueueBFS {
    public static List<Integer> bfs(Map<Integer, List<Integer>> graph, Integer start) {
        List<Integer> order = new List<Integer>();
        Set<Integer> visited = new Set<Integer>{start};
        List<Integer> queue = new List<Integer>{start};
        while (!queue.isEmpty()) {
            Integer node = queue.remove(0);
            order.add(node);
            for (Integer neighbor : graph.get(node)) {
                if (!visited.contains(neighbor)) {
                    visited.add(neighbor);
                    queue.add(neighbor);
                }
            }
        }
        return order;
    }

    public static void main() {
        Map<Integer, List<Integer>> graph = new Map<Integer, List<Integer>>{
            0 => new List<Integer>{1, 2},
            1 => new List<Integer>{3},
            2 => new List<Integer>{3},
            3 => new List<Integer>()
        };
        System.debug(bfs(graph, 0));
    }
}
