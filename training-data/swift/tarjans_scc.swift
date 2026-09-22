final class TarjanSCC {
    private let graph: [Int: [Int]]
    private var indexCounter = 0
    private var stack: [Int] = []
    private var onStack: Set<Int> = []
    private var indices: [Int: Int] = [:]
    private var lowlink: [Int: Int] = [:]
    private var result: [[Int]] = []

    init(_ graph: [Int: [Int]]) {
        self.graph = graph
    }

    func run() -> [[Int]] {
        for node in graph.keys.sorted() where indices[node] == nil {
            strongConnect(node)
        }
        return result
    }

    private func strongConnect(_ v: Int) {
        indices[v] = indexCounter
        lowlink[v] = indexCounter
        indexCounter += 1
        stack.append(v)
        onStack.insert(v)

        for w in graph[v] ?? [] {
            if indices[w] == nil {
                strongConnect(w)
                lowlink[v] = min(lowlink[v]!, lowlink[w]!)
            } else if onStack.contains(w) {
                lowlink[v] = min(lowlink[v]!, indices[w]!)
            }
        }

        if lowlink[v] == indices[v] {
            var component: [Int] = []
            while true {
                let w = stack.removeLast()
                onStack.remove(w)
                component.append(w)
                if w == v { break }
            }
            result.append(component)
        }
    }
}

let graph: [Int: [Int]] = [
    0: [1],
    1: [2],
    2: [0, 3],
    3: [4],
    4: [3],
]

let sccs = TarjanSCC(graph).run()
for component in sccs {
    print(component.sorted())
}
