#include <algorithm>
#include <iostream>
#include <vector>

class KosarajuSCC {
public:
    explicit KosarajuSCC(int n) : numNodes(n), adj(n), radj(n) {}

    void addEdge(int u, int v) {
        adj[u].push_back(v);
        radj[v].push_back(u);
    }

    std::vector<std::vector<int>> run() {
        std::vector<bool> visited(numNodes, false);
        std::vector<int> order;
        for (int i = 0; i < numNodes; i++) {
            if (!visited[i]) fillOrder(i, visited, order);
        }

        std::vector<bool> visited2(numNodes, false);
        std::vector<std::vector<int>> components;
        for (auto it = order.rbegin(); it != order.rend(); ++it) {
            if (!visited2[*it]) {
                std::vector<int> component;
                collect(*it, visited2, component);
                std::sort(component.begin(), component.end());
                components.push_back(component);
            }
        }
        return components;
    }

private:
    int numNodes;
    std::vector<std::vector<int>> adj;
    std::vector<std::vector<int>> radj;

    void fillOrder(int node, std::vector<bool>& visited, std::vector<int>& order) {
        visited[node] = true;
        for (int next : adj[node]) {
            if (!visited[next]) fillOrder(next, visited, order);
        }
        order.push_back(node);
    }

    void collect(int node, std::vector<bool>& visited, std::vector<int>& component) {
        visited[node] = true;
        component.push_back(node);
        for (int next : radj[node]) {
            if (!visited[next]) collect(next, visited, component);
        }
    }
};

int main() {
    KosarajuSCC graph(8);
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
        for (int node : comp) std::cout << node << " ";
        std::cout << std::endl;
    }
    return 0;
}
