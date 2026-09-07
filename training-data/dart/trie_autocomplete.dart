class TrieNode {
  final Map<String, TrieNode> children = {};
  bool isWord = false;
}

class Trie {
  final TrieNode _root = TrieNode();

  void insert(String word) {
    var node = _root;
    for (final ch in word.split('')) {
      node = node.children.putIfAbsent(ch, () => TrieNode());
    }
    node.isWord = true;
  }

  List<String> autocomplete(String prefix) {
    var node = _root;
    for (final ch in prefix.split('')) {
      final next = node.children[ch];
      if (next == null) return [];
      node = next;
    }
    final results = <String>[];
    _collect(node, prefix, results);
    return results;
  }

  void _collect(TrieNode node, String prefix, List<String> results) {
    if (node.isWord) results.add(prefix);
    for (final entry in node.children.entries) {
      _collect(entry.value, prefix + entry.key, results);
    }
  }
}

void main() {
  final trie = Trie();
  for (final word in ['cat', 'car', 'card', 'care', 'dog']) {
    trie.insert(word);
  }
  print(trie.autocomplete('car'));
  print(trie.autocomplete('do'));
  print(trie.autocomplete('z'));
}
