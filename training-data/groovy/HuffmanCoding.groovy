class Node {
    String ch
    int freq
    Node left
    Node right

    Node(String ch, int freq, Node left = null, Node right = null) {
        this.ch = ch
        this.freq = freq
        this.left = left
        this.right = right
    }
}

def buildTree(Map<String, Integer> freqs) {
    def nodes = freqs.collect { ch, f -> new Node(ch, f) }

    while (nodes.size() > 1) {
        nodes = nodes.sort { it.freq }
        def left = nodes.remove(0)
        def right = nodes.remove(0)
        nodes << new Node(null, left.freq + right.freq, left, right)
    }
    return nodes[0]
}

def buildCodes(Node node, String prefix = "", Map<String, String> codes = [:]) {
    if (node == null) return codes
    if (node.ch != null) {
        codes[node.ch] = prefix ?: "0"
        return codes
    }
    buildCodes(node.left, prefix + "0", codes)
    buildCodes(node.right, prefix + "1", codes)
    return codes
}

def text = "abracadabra"
def freqs = text.toList().countBy { it }
def tree = buildTree(freqs)
def codes = buildCodes(tree)

println codes
def encoded = text.toList().collect { codes[it] }.join()
println encoded
println "original bits: ${text.length() * 8}, encoded bits: ${encoded.length()}"
