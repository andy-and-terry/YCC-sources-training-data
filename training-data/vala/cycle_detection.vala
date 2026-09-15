bool dfs_has_cycle(int node, Gee.HashMap<int, Gee.ArrayList<int>> graph, int[] state) {
    state[node] = 1; // in progress

    if (graph.has_key(node)) {
        foreach (int neighbor in graph[node]) {
            if (state[neighbor] == 1) return true;
            if (state[neighbor] == 0 && dfs_has_cycle(neighbor, graph, state)) return true;
        }
    }

    state[node] = 2; // done
    return false;
}

bool has_cycle(Gee.HashMap<int, Gee.ArrayList<int>> graph, int node_count) {
    int[] state = new int[node_count];
    for (int i = 0; i < node_count; i++) {
        if (state[i] == 0 && dfs_has_cycle(i, graph, state)) return true;
    }
    return false;
}

Gee.ArrayList<int> list_of(int[] values) {
    var result = new Gee.ArrayList<int>();
    foreach (int v in values) result.add(v);
    return result;
}

void main() {
    var acyclic = new Gee.HashMap<int, Gee.ArrayList<int>>();
    acyclic[0] = list_of({ 1, 2 });
    acyclic[1] = list_of({ 3 });
    acyclic[2] = list_of({ 3 });
    acyclic[3] = list_of({});

    var cyclic = new Gee.HashMap<int, Gee.ArrayList<int>>();
    cyclic[0] = list_of({ 1 });
    cyclic[1] = list_of({ 2 });
    cyclic[2] = list_of({ 0 });

    stdout.printf("%s\n", has_cycle(acyclic, 4).to_string());
    stdout.printf("%s\n", has_cycle(cyclic, 3).to_string());
}
