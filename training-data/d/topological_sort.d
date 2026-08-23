import std.stdio;
import std.container : DList;

void main() {
    int[][int] graph = [0: [1, 2], 1: [3], 2: [3], 3: []];
    int[] inDegree = new int[](4);
    foreach (node, neighbors; graph) {
        foreach (n; neighbors) inDegree[n]++;
    }
    DList!int queue;
    foreach (i; 0 .. 4) {
        if (inDegree[i] == 0) queue.insertBack(i);
    }
    int[] result;
    while (!queue.empty) {
        int node = queue.front();
        queue.removeFront();
        result ~= node;
        foreach (neighbor; graph.get(node, [])) {
            inDegree[neighbor]--;
            if (inDegree[neighbor] == 0) queue.insertBack(neighbor);
        }
    }
    writeln(result);
}
