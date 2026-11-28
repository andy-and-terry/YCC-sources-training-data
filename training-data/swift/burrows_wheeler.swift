func bwt(_ s: String) -> String {
    let chars = Array(s)
    let rots = chars.indices.map { String(chars[$0...] + chars[..<$0]) }.sorted()
    return String(rots.map { $0.last! })
}
print(bwt("banana$"))
