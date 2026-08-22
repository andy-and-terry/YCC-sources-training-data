import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.PriorityQueue;
import java.util.Set;

public class PrimMst {
    public static int prim(int numNodes, int[][] edges) {
        List<List<int[]>> graph = new ArrayList<>();
        for (int i = 0; i < numNodes; i++) graph.add(new ArrayList<>());
        for (int[] edge : edges) {
            graph.get(edge[0]).add(new int[] {edge[1], edge[2]});
            graph.get(edge[1]).add(new int[] {edge[0], edge[2]});
        }

        Set<Integer> visited = new HashSet<>();
        PriorityQueue<int[]> heap = new PriorityQueue<>((a, b) -> a[1] - b[1]);
        visited.add(0);
        heap.addAll(graph.get(0));
        int mstWeight = 0;

        while (!heap.isEmpty() && visited.size() < numNodes) {
            int[] entry = heap.poll();
            int node = entry[0];
            int weight = entry[1];
            if (visited.contains(node)) continue;
            visited.add(node);
            mstWeight += weight;
            for (int[] next : graph.get(node)) {
                if (!visited.contains(next[0])) heap.add(next);
            }
        }
        return mstWeight;
    }

    public static void main(String[] args) {
        int[][] edges = {{0, 1, 1}, {0, 2, 3}, {1, 2, 4}, {1, 3, 2}, {2, 3, 5}};
        System.out.println(prim(4, edges));
    }
}
