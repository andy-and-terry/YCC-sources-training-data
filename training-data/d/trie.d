import std.stdio;

class TrieNode {
    TrieNode[char] children;
    bool isEnd = false;
}

class Trie {
    private TrieNode root;

    this() {
        root = new TrieNode();
    }

    void insert(string word) {
        auto node = root;
        foreach (c; word) {
            if (c !in node.children) node.children[c] = new TrieNode();
            node = node.children[c];
        }
        node.isEnd = true;
    }

    private TrieNode find(string s) {
        auto node = root;
        foreach (c; s) {
            if (c !in node.children) return null;
            node = node.children[c];
        }
        return node;
    }

    bool search(string word) {
        auto node = find(word);
        return node !is null && node.isEnd;
    }

    bool startsWith(string prefix) {
        return find(prefix) !is null;
    }
}

void main() {
    auto trie = new Trie();
    foreach (w; ["cat", "car", "card"]) trie.insert(w);
    writeln(trie.search("car"));
    writeln(trie.search("ca"));
    writeln(trie.startsWith("ca"));
}
