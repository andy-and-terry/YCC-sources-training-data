#include <algorithm>
#include <iostream>
#include <stack>
#include <vector>

class TarjanSCC {
public:
    explicit TarjanSCC(int n)
        : n(n), timer(0), adj(n), disc(n, -1), low(n, -1), onStack(n, false) {}

    void addEdge(int u, int v) { adj[u].push_back(v); }

    std::vector<std::vector<int>> run() {
        for (int i = 0; i < n; i++) {
            if (disc[i] == -1) dfs(i);
        }
        return sccs;
    }

private:
    void dfs(int u) {
        disc[u] = low[u] = timer++;
        st.push(u);
        onStack[u] = true;

        for (int v : adj[u]) {
            if (disc[v] == -1) {
                dfs(v);
                low[u] = std::min(low[u], low[v]);
            } else if (onStack[v]) {
                low[u] = std::min(low[u], disc[v]);
            }
        }

        if (low[u] == disc[u]) {
            std::vector<int> component;
            while (true) {
                int v = st.top();
                st.pop();
                onStack[v] = false;
                component.push_back(v);
                if (v == u) break;
            }
            sccs.push_back(component);
        }
    }

    int n, timer;
    std::vector<std::vector<int>> adj;
    std::vector<int> disc, low;
    std::vector<bool> onStack;
    std::stack<int> st;
    std::vector<std::vector<int>> sccs;
};

int main() {
    TarjanSCC graph(5);
    graph.addEdge(0, 1);
    graph.addEdge(1, 2);
    graph.addEdge(2, 0);
    graph.addEdge(1, 3);
    graph.addEdge(3, 4);

    for (const auto& component : graph.run()) {
        for (int v : component) std::cout << v << " ";
        std::cout << std::endl;
    }
    return 0;
}
