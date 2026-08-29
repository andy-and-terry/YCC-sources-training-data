class TrieNode : Object {
    public Gee.HashMap<unichar, TrieNode> children;
    public bool is_end;

    public TrieNode() {
        children = new Gee.HashMap<unichar, TrieNode>();
        is_end = false;
    }
}

void trie_insert(TrieNode root, string word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
        unichar c = word[i];
        if (!node.children.has_key(c)) {
            node.children[c] = new TrieNode();
        }
        node = node.children[c];
    }
    node.is_end = true;
}

bool trie_contains(TrieNode root, string word) {
    TrieNode node = root;
    for (int i = 0; i < word.length; i++) {
        unichar c = word[i];
        if (!node.children.has_key(c)) return false;
        node = node.children[c];
    }
    return node.is_end;
}

void main() {
    var trie = new TrieNode();
    trie_insert(trie, "cat");
    trie_insert(trie, "car");
    stdout.printf("%s\n", trie_contains(trie, "cat").to_string());
    stdout.printf("%s\n", trie_contains(trie, "ca").to_string());
}
