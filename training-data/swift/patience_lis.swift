func lisLength(_ a: [Int]) -> Int {
    var tails: [Int] = []
    for x in a {
        var lo = 0, hi = tails.count
        while lo < hi {
            let mid = (lo + hi) / 2
            if tails[mid] < x { lo = mid + 1 } else { hi = mid }
        }
        if lo == tails.count { tails.append(x) } else { tails[lo] = x }
    }
    return tails.count
}
print(lisLength([10, 9, 2, 5, 3, 7, 101, 18]))
