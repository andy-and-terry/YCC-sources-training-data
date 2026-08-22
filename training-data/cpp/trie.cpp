#include <iostream>
#include <memory>
#include <string>
#include <unordered_map>

struct TrieNode {
    std::unordered_map<char, std::unique_ptr<TrieNode>> children;
    bool isWord = false;
};

class Trie {
public:
    void insert(const std::string& word) {
        TrieNode* node = root.get();
        for (char ch : word) {
            if (!node->children.count(ch)) node->children[ch] = std::make_unique<TrieNode>();
            node = node->children[ch].get();
        }
        node->isWord = true;
    }

    bool search(const std::string& word) const {
        TrieNode* node = find(word);
        return node != nullptr && node->isWord;
    }

    bool startsWith(const std::string& prefix) const {
        return find(prefix) != nullptr;
    }

private:
    std::unique_ptr<TrieNode> root = std::make_unique<TrieNode>();

    TrieNode* find(const std::string& s) const {
        TrieNode* node = root.get();
        for (char ch : s) {
            auto it = node->children.find(ch);
            if (it == node->children.end()) return nullptr;
            node = it->second.get();
        }
        return node;
    }
};

int main() {
    Trie trie;
    for (const auto& word : {"cat", "car", "card", "care"}) trie.insert(word);
    std::cout << trie.search("car") << " " << trie.search("ca") << " " << trie.startsWith("ca") << std::endl;
    return 0;
}
