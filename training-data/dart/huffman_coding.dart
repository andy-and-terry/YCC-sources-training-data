class _HuffmanNode {
  final String? char;
  final int frequency;
  final _HuffmanNode? left;
  final _HuffmanNode? right;

  _HuffmanNode.leaf(this.char, this.frequency)
      : left = null,
        right = null;

  _HuffmanNode.internal(this.left, this.right)
      : char = null,
        frequency = (left?.frequency ?? 0) + (right?.frequency ?? 0);
}

Map<String, String> buildHuffmanCodes(Map<String, int> frequencies) {
  final nodes = frequencies.entries
      .map((e) => _HuffmanNode.leaf(e.key, e.value))
      .toList();

  while (nodes.length > 1) {
    nodes.sort((a, b) => a.frequency.compareTo(b.frequency));
    final first = nodes.removeAt(0);
    final second = nodes.removeAt(0);
    nodes.add(_HuffmanNode.internal(first, second));
  }

  final codes = <String, String>{};
  void assign(_HuffmanNode? node, String prefix) {
    if (node == null) return;
    if (node.char != null) {
      codes[node.char!] = prefix.isEmpty ? '0' : prefix;
      return;
    }
    assign(node.left, '${prefix}0');
    assign(node.right, '${prefix}1');
  }

  assign(nodes.isEmpty ? null : nodes.first, '');
  return codes;
}

void main() {
  final frequencies = {'a': 5, 'b': 9, 'c': 12, 'd': 13, 'e': 16, 'f': 45};
  final codes = buildHuffmanCodes(frequencies);
  final sortedKeys = codes.keys.toList()..sort();
  for (final key in sortedKeys) {
    print('$key: ${codes[key]}');
  }
}
