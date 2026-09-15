import std.stdio;
import std.container : DList;

int[] bfs(int[][int] graph, int start, int nodeCount) {
    auto order_ = new int[](0);
    auto visited = new bool[](nodeCount);
    DList!int queue;

    visited[start] = true;
    queue.insertBack(start);

    while (!queue.empty) {
        int node = queue.front;
        queue.removeFront();
        order_ ~= node;

        if (auto neighbors = node in graph) {
            foreach (n; *neighbors) {
                if (!visited[n]) {
                    visited[n] = true;
                    queue.insertBack(n);
                }
            }
        }
    }

    return order_;
}

void main() {
    int[][int] graph;
    graph[0] = [1, 2];
    graph[1] = [0, 3];
    graph[2] = [0, 3];
    graph[3] = [1, 2, 4];
    graph[4] = [3];

    writeln(bfs(graph, 0, 5));
}
