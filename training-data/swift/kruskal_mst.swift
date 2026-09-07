final class UnionFind {
    private var parent: [Int]

    init(_ n: Int) {
        parent = Array(0..<n)
    }

    func find(_ x: Int) -> Int {
        if parent[x] != x { parent[x] = find(parent[x]) }
        return parent[x]
    }

    func union(_ a: Int, _ b: Int) -> Bool {
        let rootA = find(a), rootB = find(b)
        if rootA == rootB { return false }
        parent[rootA] = rootB
        return true
    }
}

func kruskalMST(nodeCount: Int, edges: [(Int, Int, Int)]) -> [(Int, Int, Int)] {
    let uf = UnionFind(nodeCount)
    var mst: [(Int, Int, Int)] = []
    for edge in edges.sorted(by: { $0.2 < $1.2 }) {
        if uf.union(edge.0, edge.1) {
            mst.append(edge)
        }
    }
    return mst
}

let edges = [
    (0, 1, 4), (0, 2, 1), (1, 2, 2),
    (1, 3, 5), (2, 3, 8), (3, 4, 3),
]

let mst = kruskalMST(nodeCount: 5, edges: edges)
for (u, v, w) in mst {
    print("\(u)-\(v): \(w)")
}
print("total weight:", mst.reduce(0) { $0 + $1.2 })
