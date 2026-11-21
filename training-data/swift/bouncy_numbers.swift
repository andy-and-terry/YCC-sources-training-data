// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
func isBouncy(_ n: Int) -> Bool {
    let d = Array(String(n))
    return d != d.sorted() && d != d.sorted(by: >)
}

print((1..<1000).filter(isBouncy).count)
