class TarjanScc {
    Map<Integer, List<Integer>> adj = [:].withDefault { [] }
    Map<Integer, Integer> index = [:]
    Map<Integer, Integer> low = [:]
    Deque<Integer> stack = new ArrayDeque<>()
    Set<Integer> onStack = new HashSet<>()
    List<List<Integer>> sccs = []
    int counter = 0

    void addEdge(int u, int v) {
        adj[u] << v
    }

    void strongConnect(int v) {
        index[v] = counter
        low[v] = counter
        counter++
        stack.push(v)
        onStack << v

        for (w in adj[v]) {
            if (!index.containsKey(w)) {
                strongConnect(w)
                low[v] = Math.min(low[v], low[w])
            } else if (onStack.contains(w)) {
                low[v] = Math.min(low[v], index[w])
            }
        }

        if (low[v] == index[v]) {
            def component = []
            int w
            while (true) {
                w = stack.pop()
                onStack.remove(w)
                component << w
                if (w == v) break
            }
            sccs << component
        }
    }

    List<List<Integer>> run(int numNodes) {
        for (v in 0..<numNodes) {
            if (!index.containsKey(v)) strongConnect(v)
        }
        return sccs
    }
}

def g = new TarjanScc()
g.addEdge(0, 1)
g.addEdge(1, 2)
g.addEdge(2, 0)
g.addEdge(1, 3)
g.addEdge(3, 4)
println g.run(5)
