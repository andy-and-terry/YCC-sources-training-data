func nextTerm(_ s: String) -> String {
    var out = ""
    var chars = Array(s)[...]
    while let first = chars.first {
        let run = chars.prefix { $0 == first }
        out += "\(run.count)\(first)"
        chars = chars.dropFirst(run.count)
    }
    return out
}

let terms = sequence(first: "1", next: nextTerm).prefix(8)
terms.forEach { print($0) }
