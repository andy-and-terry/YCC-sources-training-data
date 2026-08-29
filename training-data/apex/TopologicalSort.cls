public class TopologicalSort {
    public static List<String> topSort(Map<String, List<String>> graph) {
        List<String> order = new List<String>();
        Set<String> visited = new Set<String>();
        for (String node : graph.keySet()) {
            visit(node, graph, visited, order);
        }
        return order;
    }

    private static void visit(String node, Map<String, List<String>> graph, Set<String> visited, List<String> order) {
        if (visited.contains(node)) {
            return;
        }
        visited.add(node);
        for (String dep : graph.get(node)) {
            visit(dep, graph, visited, order);
        }
        order.add(node);
    }

    public static void main() {
        Map<String, List<String>> graph = new Map<String, List<String>>{
            'a' => new List<String>{'b', 'c'},
            'b' => new List<String>{'d'},
            'c' => new List<String>{'d'},
            'd' => new List<String>()
        };
        System.debug(topSort(graph));
    }
}
