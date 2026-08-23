class TrieNode {
    Map<Character, TrieNode> children = [:]
    boolean isEnd = false
}

def insert(TrieNode root, String word) {
    def node = root
    word.each { c ->
        node = node.children.computeIfAbsent(c as Character) { new TrieNode() }
    }
    node.isEnd = true
}

def contains(TrieNode root, String word) {
    def node = root
    for (c in word) {
        node = node.children[c as Character]
        if (node == null) return false
    }
    return node.isEnd
}

def trie = new TrieNode()
insert(trie, "cat")
insert(trie, "car")
println contains(trie, "cat")
println contains(trie, "ca")
