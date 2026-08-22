#include <algorithm>
#include <iostream>
#include <memory>
#include <string>
#include <unordered_map>
#include <vector>

struct ACNode {
    std::unordered_map<char, std::unique_ptr<ACNode>> children;
    bool isWord = false;
};

class Autocomplete {
public:
    explicit Autocomplete(const std::vector<std::string>& words) {
        for (auto& w : words) insert(w);
    }

    void insert(const std::string& word) {
        ACNode* node = root.get();
        for (char ch : word) {
            if (!node->children.count(ch)) node->children[ch] = std::make_unique<ACNode>();
            node = node->children[ch].get();
        }
        node->isWord = true;
    }

    std::vector<std::string> suggestions(const std::string& prefix) const {
        ACNode* node = root.get();
        for (char ch : prefix) {
            auto it = node->children.find(ch);
            if (it == node->children.end()) return {};
            node = it->second.get();
        }
        std::vector<std::string> results;
        collect(node, prefix, results);
        std::sort(results.begin(), results.end());
        return results;
    }

private:
    std::unique_ptr<ACNode> root = std::make_unique<ACNode>();

    void collect(ACNode* node, const std::string& path, std::vector<std::string>& results) const {
        if (node->isWord) results.push_back(path);
        for (auto& [ch, child] : node->children) collect(child.get(), path + ch, results);
    }
};

int main() {
    Autocomplete ac({"cat", "car", "card", "care", "dog"});
    for (auto& s : ac.suggestions("ca")) std::cout << s << " ";
    std::cout << std::endl;
    return 0;
}
