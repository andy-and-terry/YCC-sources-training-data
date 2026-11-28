func jaccard<T: Hashable>(_ a: Set<T>, _ b: Set<T>) -> Double {
    let union = a.union(b).count
    return union == 0 ? 1.0 : Double(a.intersection(b).count) / Double(union)
}

print(jaccard([1, 2, 3, 4], [3, 4, 5]))
