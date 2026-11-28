let n = 8
for r in 0..<n {
    var line = String(repeating: " ", count: n - r - 1)
    for c in 0...r { line += (r & c) == c ? "* " : "  " }
    print(line)
}
