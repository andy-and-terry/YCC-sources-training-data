final class MedianFinder {
    private var lower: [Int] = [] // max side, sorted ascending; last element is the max
    private var upper: [Int] = [] // min side, sorted ascending; first element is the min

    func addNumber(_ value: Int) {
        if let maxLower = lower.last, value < maxLower {
            insert(value, into: &lower)
        } else {
            insert(value, into: &upper)
        }
        rebalance()
    }

    private func insert(_ value: Int, into array: inout [Int]) {
        let index = array.firstIndex { $0 > value } ?? array.count
        array.insert(value, at: index)
    }

    private func rebalance() {
        if lower.count > upper.count + 1 {
            upper.insert(lower.removeLast(), at: 0)
        } else if upper.count > lower.count + 1 {
            lower.append(upper.removeFirst())
        }
    }

    func median() -> Double {
        if lower.count == upper.count {
            guard let a = lower.last, let b = upper.first else { return 0 }
            return Double(a + b) / 2.0
        }
        return lower.count > upper.count ? Double(lower.last!) : Double(upper.first!)
    }
}

let finder = MedianFinder()
for value in [5, 15, 1, 3] {
    finder.addNumber(value)
    print(finder.median())
}
