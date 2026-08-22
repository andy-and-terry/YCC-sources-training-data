#include <iostream>
#include <memory>
#include <queue>
#include <string>
#include <unordered_map>
#include <vector>

struct HuffNode {
    char ch;
    bool hasChar;
    int freq;
    HuffNode* left;
    HuffNode* right;
};

struct Compare {
    bool operator()(const HuffNode* a, const HuffNode* b) const {
        return a->freq > b->freq;
    }
};

HuffNode* buildTree(const std::string& text, std::vector<std::unique_ptr<HuffNode>>& storage) {
    std::unordered_map<char, int> counts;
    for (char ch : text) counts[ch]++;

    std::priority_queue<HuffNode*, std::vector<HuffNode*>, Compare> heap;
    for (auto& [ch, freq] : counts) {
        storage.push_back(std::make_unique<HuffNode>(HuffNode{ch, true, freq, nullptr, nullptr}));
        heap.push(storage.back().get());
    }

    while (heap.size() > 1) {
        HuffNode* a = heap.top(); heap.pop();
        HuffNode* b = heap.top(); heap.pop();
        storage.push_back(std::make_unique<HuffNode>(HuffNode{0, false, a->freq + b->freq, a, b}));
        heap.push(storage.back().get());
    }
    return heap.top();
}

void buildCodes(HuffNode* node, const std::string& prefix, std::unordered_map<char, std::string>& codes) {
    if (node->hasChar) {
        codes[node->ch] = prefix.empty() ? "0" : prefix;
        return;
    }
    buildCodes(node->left, prefix + "0", codes);
    buildCodes(node->right, prefix + "1", codes);
}

std::string encode(const std::string& text) {
    std::vector<std::unique_ptr<HuffNode>> storage;
    HuffNode* tree = buildTree(text, storage);
    std::unordered_map<char, std::string> codes;
    buildCodes(tree, "", codes);
    std::string result;
    for (char ch : text) result += codes[ch];
    return result;
}

int main() {
    std::cout << encode("abracadabra") << std::endl;
    return 0;
}
