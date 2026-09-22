import java.util.List;
import java.util.Map;

public class CycleDetection {
    enum State { WHITE, GRAY, BLACK }

    public static boolean hasCycle(Map<Integer, List<Integer>> graph) {
        Map<Integer, State> state = new java.util.HashMap<>();
        for (int node : graph.keySet()) state.put(node, State.WHITE);

        for (int node : graph.keySet()) {
            if (state.get(node) == State.WHITE && visit(node, graph, state)) {
                return true;
            }
        }
        return false;
    }

    private static boolean visit(int node, Map<Integer, List<Integer>> graph, Map<Integer, State> state) {
        state.put(node, State.GRAY);
        for (int next : graph.getOrDefault(node, List.of())) {
            State s = state.getOrDefault(next, State.WHITE);
            if (s == State.GRAY) return true;
            if (s == State.WHITE && visit(next, graph, state)) return true;
        }
        state.put(node, State.BLACK);
        return false;
    }

    public static void main(String[] args) {
        Map<Integer, List<Integer>> acyclic = Map.of(0, List.of(1), 1, List.of(2), 2, List.of());
        Map<Integer, List<Integer>> cyclic = Map.of(0, List.of(1), 1, List.of(2), 2, List.of(0));
        System.out.println(hasCycle(acyclic));
        System.out.println(hasCycle(cyclic));
    }
}
