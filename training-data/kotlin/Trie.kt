class TrieNode {
    val children = HashMap<Char, TrieNode>()
    var isEndOfWord = false
}

class Trie {
    private val root = TrieNode()

    fun insert(word: String) {
        var node = root
        for (ch in word) {
            node = node.children.getOrPut(ch) { TrieNode() }
        }
        node.isEndOfWord = true
    }

    fun search(word: String): Boolean {
        var node = root
        for (ch in word) {
            node = node.children[ch] ?: return false
        }
        return node.isEndOfWord
    }
}

fun main() {
    val trie = Trie()
    listOf("cat", "car", "card").forEach { trie.insert(it) }
    println(trie.search("car"))
    println(trie.search("ca"))
}
