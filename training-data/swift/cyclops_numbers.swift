// Cyclops numbers: odd digit count, middle digit zero, no other zeros.
// Count those in 1..99999 (expected 6642).
func isCyclops(_ n: Int) -> Bool {
    let s = Array(String(n))
    return s.count % 2 == 1 && s[s.count / 2] == "0" && s.filter { $0 == "0" }.count == 1
}

print((1..<100000).filter(isCyclops).count)
