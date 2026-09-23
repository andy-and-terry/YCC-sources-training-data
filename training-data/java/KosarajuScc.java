import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class KosarajuScc {
    private final Map<Integer, List<Integer>> adj = new HashMap<>();
    private final Map<Integer, List<Integer>> reverseAdj = new HashMap<>();
    private final int numNodes;

    KosarajuScc(int numNodes) {
        this.numNodes = numNodes;
    }

    void addEdge(int u, int v) {
        adj.computeIfAbsent(u, k -> new ArrayList<>()).add(v);
        reverseAdj.computeIfAbsent(v, k -> new ArrayList<>()).add(u);
    }

    List<List<Integer>> run() {
        Set<Integer> visited = new HashSet<>();
        Deque<Integer> order = new ArrayDeque<>();
        for (int v = 0; v < numNodes; v++) {
            if (!visited.contains(v)) {
                fillOrder(v, visited, order);
            }
        }

        List<List<Integer>> sccs = new ArrayList<>();
        Set<Integer> visited2 = new HashSet<>();
        while (!order.isEmpty()) {
            int v = order.pop();
            if (!visited2.contains(v)) {
                List<Integer> component = new ArrayList<>();
                collect(v, reverseAdj, visited2, component);
                sccs.add(component);
            }
        }
        return sccs;
    }

    private void fillOrder(int v, Set<Integer> visited, Deque<Integer> order) {
        visited.add(v);
        for (int w : adj.getOrDefault(v, List.of())) {
            if (!visited.contains(w)) {
                fillOrder(w, visited, order);
            }
        }
        order.push(v);
    }

    private void collect(int v, Map<Integer, List<Integer>> graph, Set<Integer> visited, List<Integer> component) {
        visited.add(v);
        component.add(v);
        for (int w : graph.getOrDefault(v, List.of())) {
            if (!visited.contains(w)) {
                collect(w, graph, visited, component);
            }
        }
    }

    public static void main(String[] args) {
        KosarajuScc g = new KosarajuScc(5);
        g.addEdge(0, 1);
        g.addEdge(1, 2);
        g.addEdge(2, 0);
        g.addEdge(1, 3);
        g.addEdge(3, 4);
        System.out.println(g.run());
    }
}
