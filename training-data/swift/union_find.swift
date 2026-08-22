final class UnionFind {
    private var parent: [Int]
    private var rank: [Int]

    init(_ n: Int) {
        parent = Array(0..<n)
        rank = Array(repeating: 0, count: n)
    }

    func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }

    func union(_ a: Int, _ b: Int) {
        let rootA = find(a)
        let rootB = find(b)
        if rootA == rootB { return }
        if rank[rootA] < rank[rootB] {
            parent[rootA] = rootB
        } else if rank[rootA] > rank[rootB] {
            parent[rootB] = rootA
        } else {
            parent[rootB] = rootA
            rank[rootA] += 1
        }
    }

    func connected(_ a: Int, _ b: Int) -> Bool {
        find(a) == find(b)
    }
}

let uf = UnionFind(6)
uf.union(0, 1)
uf.union(1, 2)
print(uf.connected(0, 2))
print(uf.connected(0, 5))
