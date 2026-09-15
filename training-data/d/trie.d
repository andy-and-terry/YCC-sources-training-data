import std.stdio;

class TrieNode {
    TrieNode[char] children;
    bool isWord = false;
}

class Trie {
    private TrieNode root;

    this() {
        root = new TrieNode();
    }

    void insert(string word) {
        auto node = root;
        foreach (ch; word) {
            if ((ch in node.children) is null) {
                node.children[ch] = new TrieNode();
            }
            node = node.children[ch];
        }
        node.isWord = true;
    }

    bool contains(string word) {
        auto node = find(word);
        return node !is null && node.isWord;
    }

    bool startsWith(string prefix) {
        return find(prefix) !is null;
    }

    private TrieNode find(string s) {
        auto node = root;
        foreach (ch; s) {
            auto next = ch in node.children;
            if (next is null) return null;
            node = *next;
        }
        return node;
    }
}

void main() {
    auto trie = new Trie();
    foreach (word; ["cat", "car", "card", "care", "dog"]) {
        trie.insert(word);
    }
    writeln(trie.contains("car"));
    writeln(trie.contains("ca"));
    writeln(trie.startsWith("ca"));
    writeln(trie.startsWith("do"));
    writeln(trie.startsWith("z"));
}
