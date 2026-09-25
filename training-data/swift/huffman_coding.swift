indirect enum HuffmanNode {
    case leaf(character: Character, frequency: Int)
    case node(left: HuffmanNode, right: HuffmanNode, frequency: Int)

    var frequency: Int {
        switch self {
        case .leaf(_, let frequency): return frequency
        case .node(_, _, let frequency): return frequency
        }
    }
}

func buildHuffmanTree(_ frequencies: [Character: Int]) -> HuffmanNode? {
    var nodes = frequencies.map { HuffmanNode.leaf(character: $0.key, frequency: $0.value) }

    while nodes.count > 1 {
        nodes.sort { $0.frequency < $1.frequency }
        let first = nodes.removeFirst()
        let second = nodes.removeFirst()
        let merged = HuffmanNode.node(left: first, right: second, frequency: first.frequency + second.frequency)
        nodes.append(merged)
    }

    return nodes.first
}

func buildCodes(_ node: HuffmanNode, prefix: String = "", into codes: inout [Character: String]) {
    switch node {
    case .leaf(let character, _):
        codes[character] = prefix.isEmpty ? "0" : prefix
    case .node(let left, let right, _):
        buildCodes(left, prefix: prefix + "0", into: &codes)
        buildCodes(right, prefix: prefix + "1", into: &codes)
    }
}

let text = "abracadabra"
let frequencies = Dictionary(text.map { ($0, 1) }, uniquingKeysWith: +)

guard let tree = buildHuffmanTree(frequencies) else {
    fatalError("empty input")
}

var codes: [Character: String] = [:]
buildCodes(tree, into: &codes)

for (character, code) in codes.sorted(by: { $0.key < $1.key }) {
    print("\(character): \(code)")
}

let encoded = text.map { codes[$0]! }.joined()
print("encoded length: \(encoded.count) bits vs \(text.count * 8) bits raw")
