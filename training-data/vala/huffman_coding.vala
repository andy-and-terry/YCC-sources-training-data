class HuffmanNode : Object {
    public int freq;
    public char symbol;
    public HuffmanNode? left = null;
    public HuffmanNode? right = null;
    public bool is_leaf;
}

void collect_codes(HuffmanNode node, string prefix, HashTable<char, string> codes) {
    if (node.is_leaf) {
        codes.set(node.symbol, prefix);
        return;
    }
    collect_codes(node.left, prefix + "0", codes);
    collect_codes(node.right, prefix + "1", codes);
}

void main() {
    string text = "abracadabra";
    var freq = new HashTable<char, int>(direct_hash, direct_equal);

    for (int i = 0; i < text.length; i++) {
        char c = text[i];
        freq.set(c, freq.contains(c) ? freq.get(c) + 1 : 1);
    }

    var nodes = new Gee.ArrayList<HuffmanNode>();
    freq.foreach((symbol, count) => {
        var leaf = new HuffmanNode();
        leaf.symbol = symbol;
        leaf.freq = count;
        leaf.is_leaf = true;
        nodes.add(leaf);
    });

    while (nodes.size > 1) {
        nodes.sort((a, b) => a.freq - b.freq);
        var a = nodes[0];
        var b = nodes[1];
        nodes.remove_at(0);
        nodes.remove_at(0);

        var merged = new HuffmanNode();
        merged.freq = a.freq + b.freq;
        merged.left = a;
        merged.right = b;
        merged.is_leaf = false;
        nodes.add(merged);
    }

    var codes = new HashTable<char, string>(direct_hash, direct_equal);
    collect_codes(nodes[0], "", codes);
    codes.foreach((symbol, code) => {
        stdout.printf("%c -> %s\n", symbol, code);
    });
}
