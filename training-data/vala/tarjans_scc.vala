class TarjanSCC : Object {
    int[][] graph;
    int index_counter = 0;
    int[] indices;
    int[] lowlink;
    bool[] on_stack;
    Gee.ArrayList<int> stack;
    Gee.ArrayList<Gee.ArrayList<int>> result;

    public TarjanSCC(int[][] graph) {
        this.graph = graph;
        int n = graph.length;
        indices = new int[n];
        lowlink = new int[n];
        on_stack = new bool[n];
        for (int i = 0; i < n; i++) {
            indices[i] = -1;
        }
        stack = new Gee.ArrayList<int>();
        result = new Gee.ArrayList<Gee.ArrayList<int>>();
    }

    public Gee.ArrayList<Gee.ArrayList<int>> run() {
        for (int v = 0; v < graph.length; v++) {
            if (indices[v] == -1) {
                strong_connect(v);
            }
        }
        return result;
    }

    void strong_connect(int v) {
        indices[v] = index_counter;
        lowlink[v] = index_counter;
        index_counter++;
        stack.add(v);
        on_stack[v] = true;

        foreach (int w in graph[v]) {
            if (indices[w] == -1) {
                strong_connect(w);
                lowlink[v] = int.min(lowlink[v], lowlink[w]);
            } else if (on_stack[w]) {
                lowlink[v] = int.min(lowlink[v], indices[w]);
            }
        }

        if (lowlink[v] == indices[v]) {
            var component = new Gee.ArrayList<int>();
            while (true) {
                int w = stack[stack.size - 1];
                stack.remove_at(stack.size - 1);
                on_stack[w] = false;
                component.add(w);
                if (w == v) {
                    break;
                }
            }
            result.add(component);
        }
    }
}

void main() {
    int[][] graph = new int[5][];
    graph[0] = { 1 };
    graph[1] = { 2 };
    graph[2] = { 0, 3 };
    graph[3] = { 4 };
    graph[4] = { 3 };

    var tarjan = new TarjanSCC(graph);
    var sccs = tarjan.run();
    foreach (var component in sccs) {
        foreach (int node in component) {
            stdout.printf("%d ", node);
        }
        stdout.printf("\n");
    }
}
