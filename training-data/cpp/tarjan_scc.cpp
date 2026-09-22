#include <iostream>
#include <vector>
#include <stack>
#include <algorithm>

class TarjanSCC {
public:
    explicit TarjanSCC(int n)
        : n_(n), adj_(n), disc_(n, -1), low_(n, -1), onStack_(n, false) {}

    void addEdge(int u, int v) { adj_[u].push_back(v); }

    std::vector<std::vector<int>> run() {
        for (int i = 0; i < n_; i++) {
            if (disc_[i] == -1) dfs(i);
        }
        std::reverse(sccs_.begin(), sccs_.end());
        return sccs_;
    }

private:
    void dfs(int u) {
        disc_[u] = low_[u] = counter_++;
        stack_.push(u);
        onStack_[u] = true;

        for (int v : adj_[u]) {
            if (disc_[v] == -1) {
                dfs(v);
                low_[u] = std::min(low_[u], low_[v]);
            } else if (onStack_[v]) {
                low_[u] = std::min(low_[u], disc_[v]);
            }
        }

        if (low_[u] == disc_[u]) {
            std::vector<int> component;
            while (true) {
                int w = stack_.top();
                stack_.pop();
                onStack_[w] = false;
                component.push_back(w);
                if (w == u) break;
            }
            sccs_.push_back(component);
        }
    }

    int n_;
    std::vector<std::vector<int>> adj_;
    std::vector<int> disc_, low_;
    std::vector<bool> onStack_;
    std::stack<int> stack_;
    int counter_ = 0;
    std::vector<std::vector<int>> sccs_;
};

int main() {
    // Two SCCs: {0,1,2} and {3,4}; 5,6,7 are singleton components.
    TarjanSCC g(8);
    g.addEdge(0, 1);
    g.addEdge(1, 2);
    g.addEdge(2, 0);
    g.addEdge(2, 3);
    g.addEdge(3, 4);
    g.addEdge(4, 3);
    g.addEdge(5, 6);
    g.addEdge(6, 7);

    auto sccs = g.run();
    std::cout << "total SCCs: " << sccs.size() << std::endl;
    for (const auto& comp : sccs) {
        std::cout << "SCC:";
        for (int v : comp) std::cout << " " << v;
        std::cout << std::endl;
    }
    return 0;
}
