int[] dijkstra(Gee.HashMap<string, Gee.ArrayList<int[]>> graph, string source, string[] nodeNames) {
    var dist = new Gee.HashMap<string, int>();
    foreach (string n in nodeNames) dist[n] = 999999;
    dist[source] = 0;
    var visited = new Gee.ArrayList<string>();

    for (int iter = 0; iter < nodeNames.length; iter++) {
        string bestNode = "";
        int bestDist = 999999;
        foreach (string n in nodeNames) {
            if (!visited.contains(n) && dist[n] < bestDist) {
                bestNode = n;
                bestDist = dist[n];
            }
        }
        if (bestNode == "") break;
        visited.add(bestNode);
    }

    int[] result = {};
    foreach (string n in nodeNames) result += dist[n];
    return result;
}

void main() {
    stdout.printf("dijkstra demo using Gee.HashMap-backed adjacency lists\n");
}
