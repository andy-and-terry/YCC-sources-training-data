import java.util.ArrayList;
import java.util.List;
import java.util.PriorityQueue;

public class Dijkstra {
    record Edge(int to, int weight) {}

    record NodeDist(int node, int dist) {}

    public static int[] shortestPaths(List<List<Edge>> graph, int source) {
        int n = graph.size();
        int[] dist = new int[n];
        java.util.Arrays.fill(dist, Integer.MAX_VALUE);
        dist[source] = 0;

        PriorityQueue<NodeDist> pq = new PriorityQueue<>((a, b) -> a.dist() - b.dist());
        pq.add(new NodeDist(source, 0));

        while (!pq.isEmpty()) {
            NodeDist current = pq.poll();
            if (current.dist() > dist[current.node()]) continue;
            for (Edge edge : graph.get(current.node())) {
                int next = current.dist() + edge.weight();
                if (next < dist[edge.to()]) {
                    dist[edge.to()] = next;
                    pq.add(new NodeDist(edge.to(), next));
                }
            }
        }
        return dist;
    }

    public static void main(String[] args) {
        List<List<Edge>> graph = new ArrayList<>();
        for (int i = 0; i < 4; i++) graph.add(new ArrayList<>());
        graph.get(0).add(new Edge(1, 4));
        graph.get(0).add(new Edge(2, 1));
        graph.get(1).add(new Edge(3, 1));
        graph.get(2).add(new Edge(1, 2));
        graph.get(2).add(new Edge(3, 5));

        System.out.println(java.util.Arrays.toString(shortestPaths(graph, 0)));
    }
}
