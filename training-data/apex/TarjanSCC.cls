public class TarjanSCC {
    private static Map<String, Integer> indexMap = new Map<String, Integer>();
    private static Map<String, Integer> lowLink = new Map<String, Integer>();
    private static Set<String> onStack = new Set<String>();
    private static List<String> stack = new List<String>();
    private static Integer counter = 0;
    private static List<List<String>> result = new List<List<String>>();

    private static void strongConnect(String node, Map<String, List<String>> graph) {
        indexMap.put(node, counter);
        lowLink.put(node, counter);
        counter++;
        stack.add(node);
        onStack.add(node);

        for (String neighbor : graph.get(node)) {
            if (!indexMap.containsKey(neighbor)) {
                strongConnect(neighbor, graph);
                lowLink.put(node, Math.min(lowLink.get(node), lowLink.get(neighbor)));
            } else if (onStack.contains(neighbor)) {
                lowLink.put(node, Math.min(lowLink.get(node), indexMap.get(neighbor)));
            }
        }

        if (lowLink.get(node).equals(indexMap.get(node))) {
            List<String> component = new List<String>();
            String w;
            do {
                w = stack.remove(stack.size() - 1);
                onStack.remove(w);
                component.add(w);
            } while (w != node);
            result.add(component);
        }
    }

    public static List<List<String>> findSCCs(Map<String, List<String>> graph) {
        indexMap.clear();
        lowLink.clear();
        onStack.clear();
        stack.clear();
        counter = 0;
        result.clear();
        for (String node : graph.keySet()) {
            if (!indexMap.containsKey(node)) {
                strongConnect(node, graph);
            }
        }
        return result;
    }

    public static void main() {
        Map<String, List<String>> graph = new Map<String, List<String>>{
            'a' => new List<String>{'b'},
            'b' => new List<String>{'c'},
            'c' => new List<String>{'a', 'd'},
            'd' => new List<String>{'e'},
            'e' => new List<String>{'d'}
        };
        System.debug(findSCCs(graph));
    }
}
