func insertInterval(_ iv: [(Int, Int)], _ new: (Int, Int)) -> [(Int, Int)] {
    var out: [(Int, Int)] = []
    var merged = new
    var i = 0
    while i < iv.count && iv[i].1 < merged.0 { out.append(iv[i]); i += 1 }
    while i < iv.count && iv[i].0 <= merged.1 {
        merged = (min(merged.0, iv[i].0), max(merged.1, iv[i].1))
        i += 1
    }
    out.append(merged)
    out.append(contentsOf: iv[i...])
    return out
}

print(insertInterval([(1, 3), (6, 9)], (2, 5))) // [(1, 5), (6, 9)]
