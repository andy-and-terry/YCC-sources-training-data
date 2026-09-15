import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TarjanScc {
    private final Map<Integer, List<Integer>> adj = new HashMap<>();
    private final Map<Integer, Integer> index = new HashMap<>();
    private final Map<Integer, Integer> low = new HashMap<>();
    private final Deque<Integer> stack = new ArrayDeque<>();
    private final Map<Integer, Boolean> onStack = new HashMap<>();
    private final List<List<Integer>> sccs = new ArrayList<>();
    private int counter = 0;

    void addEdge(int u, int v) {
        adj.computeIfAbsent(u, k -> new ArrayList<>()).add(v);
    }

    private void strongConnect(int v) {
        index.put(v, counter);
        low.put(v, counter);
        counter++;
        stack.push(v);
        onStack.put(v, true);

        for (int w : adj.getOrDefault(v, List.of())) {
            if (!index.containsKey(w)) {
                strongConnect(w);
                low.put(v, Math.min(low.get(v), low.get(w)));
            } else if (onStack.getOrDefault(w, false)) {
                low.put(v, Math.min(low.get(v), index.get(w)));
            }
        }

        if (low.get(v).equals(index.get(v))) {
            List<Integer> component = new ArrayList<>();
            int w;
            do {
                w = stack.pop();
                onStack.put(w, false);
                component.add(w);
            } while (w != v);
            sccs.add(component);
        }
    }

    List<List<Integer>> run(int numNodes) {
        for (int v = 0; v < numNodes; v++) {
            if (!index.containsKey(v)) {
                strongConnect(v);
            }
        }
        return sccs;
    }

    public static void main(String[] args) {
        TarjanScc g = new TarjanScc();
        g.addEdge(0, 1);
        g.addEdge(1, 2);
        g.addEdge(2, 0);
        g.addEdge(1, 3);
        g.addEdge(3, 4);
        System.out.println(g.run(5));
    }
}
