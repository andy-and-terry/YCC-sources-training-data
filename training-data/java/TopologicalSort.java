import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Deque;
import java.util.List;

public class TopologicalSort {
    public static List<Integer> sort(int numNodes, int[][] edges) {
        List<List<Integer>> graph = new ArrayList<>();
        int[] inDegree = new int[numNodes];
        for (int i = 0; i < numNodes; i++) graph.add(new ArrayList<>());
        for (int[] edge : edges) {
            graph.get(edge[0]).add(edge[1]);
            inDegree[edge[1]]++;
        }

        Deque<Integer> queue = new ArrayDeque<>();
        for (int n = 0; n < numNodes; n++) if (inDegree[n] == 0) queue.add(n);

        List<Integer> order = new ArrayList<>();
        while (!queue.isEmpty()) {
            int node = queue.poll();
            order.add(node);
            for (int neighbor : graph.get(node)) {
                if (--inDegree[neighbor] == 0) queue.add(neighbor);
            }
        }

        if (order.size() != numNodes) throw new IllegalStateException("graph has a cycle");
        return order;
    }

    public static void main(String[] args) {
        int[][] edges = {{5, 2}, {5, 0}, {4, 0}, {4, 1}, {2, 3}, {3, 1}};
        System.out.println(sort(6, edges));
    }
}
