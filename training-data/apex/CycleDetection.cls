public class CycleDetection {
    public static Boolean hasCycle(Map<Integer, List<Integer>> graph) {
        Set<Integer> visited = new Set<Integer>();
        Set<Integer> inStack = new Set<Integer>();

        for (Integer node : graph.keySet()) {
            if (!visited.contains(node) && dfs(node, graph, visited, inStack)) {
                return true;
            }
        }
        return false;
    }

    private static Boolean dfs(Integer node, Map<Integer, List<Integer>> graph, Set<Integer> visited, Set<Integer> inStack) {
        visited.add(node);
        inStack.add(node);

        for (Integer neighbor : graph.get(node)) {
            if (!visited.contains(neighbor)) {
                if (dfs(neighbor, graph, visited, inStack)) {
                    return true;
                }
            } else if (inStack.contains(neighbor)) {
                return true;
            }
        }
        inStack.remove(node);
        return false;
    }

    public static void main() {
        Map<Integer, List<Integer>> graph = new Map<Integer, List<Integer>>{
            0 => new List<Integer>{1},
            1 => new List<Integer>{2},
            2 => new List<Integer>{0},
            3 => new List<Integer>()
        };
        System.debug(hasCycle(graph));
    }
}
