public class DepthFirstSearch {
    public static List<Integer> traverse(Map<Integer, List<Integer>> graph, Integer start) {
        List<Integer> visitOrder = new List<Integer>();
        Set<Integer> visited = new Set<Integer>();
        List<Integer> stack = new List<Integer>();
        stack.add(start);

        while (!stack.isEmpty()) {
            Integer node = stack.remove(stack.size() - 1);
            if (visited.contains(node)) {
                continue;
            }
            visited.add(node);
            visitOrder.add(node);

            List<Integer> neighbors = graph.containsKey(node) ? graph.get(node) : new List<Integer>();
            for (Integer i = neighbors.size() - 1; i >= 0; i--) {
                if (!visited.contains(neighbors[i])) {
                    stack.add(neighbors[i]);
                }
            }
        }
        return visitOrder;
    }

    public static void main() {
        Map<Integer, List<Integer>> graph = new Map<Integer, List<Integer>>{
            0 => new List<Integer>{1, 2},
            1 => new List<Integer>{3},
            2 => new List<Integer>{3},
            3 => new List<Integer>()
        };
        System.debug(traverse(graph, 0));
    }
}
