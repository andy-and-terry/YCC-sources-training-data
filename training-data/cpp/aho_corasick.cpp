#include <iostream>
#include <queue>
#include <string>
#include <unordered_map>
#include <vector>

class AhoCorasick {
public:
    void addPattern(const std::string& pattern) {
        int node = 0;
        for (char c : pattern) {
            if (children[node].find(c) == children[node].end()) {
                children.emplace_back();
                fail.push_back(0);
                output.emplace_back();
                children[node][c] = static_cast<int>(children.size()) - 1;
            }
            node = children[node][c];
        }
        output[node].push_back(pattern);
    }

    void build() {
        std::queue<int> bfsQueue;
        for (auto& [c, next] : children[0]) {
            fail[next] = 0;
            bfsQueue.push(next);
        }
        while (!bfsQueue.empty()) {
            int node = bfsQueue.front();
            bfsQueue.pop();
            for (auto& [c, next] : children[node]) {
                int fallback = fail[node];
                while (fallback != 0 && children[fallback].find(c) == children[fallback].end()) {
                    fallback = fail[fallback];
                }
                if (children[fallback].count(c) && children[fallback][c] != next) fallback = children[fallback][c];
                fail[next] = fallback;
                for (const auto& word : output[fallback]) output[next].push_back(word);
                bfsQueue.push(next);
            }
        }
    }

    std::vector<std::pair<size_t, std::string>> search(const std::string& text) const {
        std::vector<std::pair<size_t, std::string>> matches;
        int node = 0;
        for (size_t i = 0; i < text.size(); i++) {
            char c = text[i];
            while (node != 0 && children[node].find(c) == children[node].end()) node = fail[node];
            auto it = children[node].find(c);
            if (it != children[node].end()) node = it->second;
            for (const auto& word : output[node]) matches.emplace_back(i - word.size() + 1, word);
        }
        return matches;
    }

private:
    AhoCorasick() = default;

public:
    AhoCorasick(std::initializer_list<std::string> patterns) : children(1), fail(1), output(1) {
        for (const auto& pattern : patterns) addPattern(pattern);
        build();
    }

private:
    std::vector<std::unordered_map<char, int>> children;
    std::vector<int> fail;
    std::vector<std::vector<std::string>> output;
};

int main() {
    AhoCorasick automaton{"he", "she", "his", "hers"};
    auto matches = automaton.search("ushers");
    for (const auto& [pos, word] : matches) std::cout << word << " at " << pos << std::endl;
    return 0;
}
