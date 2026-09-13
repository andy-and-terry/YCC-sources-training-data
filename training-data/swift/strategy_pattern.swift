protocol SortStrategy {
    func sort(_ array: [Int]) -> [Int]
}

struct AscendingStrategy: SortStrategy {
    func sort(_ array: [Int]) -> [Int] { array.sorted() }
}

struct DescendingStrategy: SortStrategy {
    func sort(_ array: [Int]) -> [Int] { array.sorted(by: >) }
}

final class Sorter {
    var strategy: SortStrategy

    init(strategy: SortStrategy) {
        self.strategy = strategy
    }

    func sort(_ array: [Int]) -> [Int] {
        strategy.sort(array)
    }
}

let sorter = Sorter(strategy: AscendingStrategy())
print(sorter.sort([5, 2, 8, 1]))
sorter.strategy = DescendingStrategy()
print(sorter.sort([5, 2, 8, 1]))
