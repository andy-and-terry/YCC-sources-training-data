public class Dijkstra {
    public static Map<Integer, Integer> dijkstra(Map<Integer, List<List<Integer>>> graph, Integer source) {
        Map<Integer, Integer> dist = new Map<Integer, Integer>();
        Set<Integer> visited = new Set<Integer>();
        for (Integer node : graph.keySet()) {
            dist.put(node, 999999);
        }
        dist.put(source, 0);

        for (Integer count = 0; count < graph.size(); count++) {
            Integer u = null;
            Integer best = 999999;
            for (Integer node : graph.keySet()) {
                if (!visited.contains(node) && dist.get(node) < best) {
                    best = dist.get(node);
                    u = node;
                }
            }
            if (u == null) {
                break;
            }
            visited.add(u);
            for (List<Integer> edge : graph.get(u)) {
                Integer v = edge[0];
                Integer w = edge[1];
                if (dist.get(u) + w < dist.get(v)) {
                    dist.put(v, dist.get(u) + w);
                }
            }
        }
        return dist;
    }

    public static void main() {
        Map<Integer, List<List<Integer>>> graph = new Map<Integer, List<List<Integer>>>{
            0 => new List<List<Integer>>{new List<Integer>{1, 1}, new List<Integer>{2, 4}},
            1 => new List<List<Integer>>{new List<Integer>{2, 2}, new List<Integer>{3, 5}},
            2 => new List<List<Integer>>{new List<Integer>{3, 1}},
            3 => new List<List<Integer>>()
        };
        System.debug(dijkstra(graph, 0));
    }
}
