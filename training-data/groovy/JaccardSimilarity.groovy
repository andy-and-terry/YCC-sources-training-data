double jaccard(Collection a, Collection b) {
    def sa = a as Set, sb = b as Set
    def union = sa + sb
    union.isEmpty() ? 1.0d : (sa.intersect(sb).size() / union.size()) as double
}

println jaccard([1, 2, 3, 4], [3, 4, 5])
