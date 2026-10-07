#include <algorithm>
#include <iostream>
#include <stack>
#include <vector>

class TarjanSCC {
public:
    explicit TarjanSCC(int n) : numNodes(n), adj(n), ids(n, -1), low(n, 0), onStack(n, false) {}

    void addEdge(int u, int v) { adj[u].push_back(v); }

    std::vector<std::vector<int>> run() {
        for (int i = 0; i < numNodes; i++) {
            if (ids[i] == -1) dfs(i);
        }
        return components;
    }

private:
    int numNodes;
    int counter = 0;
    std::vector<std::vector<int>> adj;
    std::vector<int> ids, low;
    std::vector<bool> onStack;
    std::stack<int> stk;
    std::vector<std::vector<int>> components;

    void dfs(int at) {
        stk.push(at);
        onStack[at] = true;
        ids[at] = low[at] = counter++;

        for (int to : adj[at]) {
            if (ids[to] == -1) dfs(to);
            if (onStack[to]) low[at] = std::min(low[at], low[to]);
        }

        if (ids[at] == low[at]) {
            std::vector<int> component;
            while (true) {
                int node = stk.top();
                stk.pop();
                onStack[node] = false;
                component.push_back(node);
                if (node == at) break;
            }
            components.push_back(component);
        }
    }
};

int main() {
    TarjanSCC graph(8);
    graph.addEdge(0, 1);
    graph.addEdge(1, 2);
    graph.addEdge(2, 0);
    graph.addEdge(2, 3);
    graph.addEdge(3, 4);
    graph.addEdge(4, 5);
    graph.addEdge(5, 3);
    graph.addEdge(6, 5);
    graph.addEdge(6, 7);

    auto sccs = graph.run();
    std::cout << "strongly connected components: " << sccs.size() << std::endl;
    for (auto& comp : sccs) {
        std::sort(comp.begin(), comp.end());
        for (int node : comp) std::cout << node << " ";
        std::cout << std::endl;
    }
    return 0;
}
