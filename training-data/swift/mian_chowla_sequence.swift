// Greedy sequence whose pairwise sums are all distinct.
var seq: [Int] = []
var sums = Set<Int>()
var cand = 1
while seq.count < 8 {
    var fresh = Set<Int>()
    var ok = true
    for x in seq + [cand] {
        let s = x + cand
        if sums.contains(s) || !fresh.insert(s).inserted {
            ok = false
            break
        }
    }
    if ok {
        seq.append(cand)
        sums.formUnion(fresh)
    }
    cand += 1
}
print(seq.map(String.init).joined(separator: " "))
