final class TrieNode {
    var children: [Character: TrieNode] = [:]
    var isEndOfWord = false
}

final class Trie {
    private let root = TrieNode()

    func insert(_ word: String) {
        var node = root
        for ch in word {
            if node.children[ch] == nil {
                node.children[ch] = TrieNode()
            }
            node = node.children[ch]!
        }
        node.isEndOfWord = true
    }

    func search(_ word: String) -> Bool {
        var node = root
        for ch in word {
            guard let next = node.children[ch] else { return false }
            node = next
        }
        return node.isEndOfWord
    }
}

let trie = Trie()
["cat", "car", "card"].forEach { trie.insert($0) }
print(trie.search("car"))
print(trie.search("ca"))
