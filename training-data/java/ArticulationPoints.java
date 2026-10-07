import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

public class ArticulationPoints {
    private final Map<Integer, List<Integer>> adj = new HashMap<>();
    private final Map<Integer, Integer> disc = new HashMap<>();
    private final Map<Integer, Integer> low = new HashMap<>();
    private final Set<Integer> articulation = new HashSet<>();
    private int timer = 0;

    void addEdge(int u, int v) {
        adj.computeIfAbsent(u, k -> new ArrayList<>()).add(v);
        adj.computeIfAbsent(v, k -> new ArrayList<>()).add(u);
    }

    private void dfs(int u, int parent, int childrenOfRoot) {
        disc.put(u, timer);
        low.put(u, timer);
        timer++;
        int children = 0;

        for (int v : adj.getOrDefault(u, List.of())) {
            if (v == parent) {
                continue;
            }
            if (disc.containsKey(v)) {
                low.put(u, Math.min(low.get(u), disc.get(v)));
            } else {
                children++;
                dfs(v, u, 0);
                low.put(u, Math.min(low.get(u), low.get(v)));

                if (parent != -1 && low.get(v) >= disc.get(u)) {
                    articulation.add(u);
                }
            }
        }

        if (parent == -1 && children > 1) {
            articulation.add(u);
        }
    }

    Set<Integer> find(int numNodes) {
        for (int v = 0; v < numNodes; v++) {
            if (!disc.containsKey(v)) {
                dfs(v, -1, 0);
            }
        }
        return articulation;
    }

    public static void main(String[] args) {
        // 0-1-2 triangle, with 1 bridging to 3, and 3 bridging to 4.
        ArticulationPoints g = new ArticulationPoints();
        g.addEdge(0, 1);
        g.addEdge(1, 2);
        g.addEdge(2, 0);
        g.addEdge(1, 3);
        g.addEdge(3, 4);
        System.out.println(new TreeSet<>(g.find(5)));
    }
}
