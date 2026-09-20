struct PriorityQueue<Element> {
    private var heap: [Element] = []
    private let areInIncreasingOrder: (Element, Element) -> Bool

    init(sort: @escaping (Element, Element) -> Bool) {
        self.areInIncreasingOrder = sort
    }

    var isEmpty: Bool { heap.isEmpty }
    var count: Int { heap.count }

    mutating func push(_ value: Element) {
        heap.append(value)
        siftUp(from: heap.count - 1)
    }

    mutating func pop() -> Element? {
        guard !heap.isEmpty else { return nil }
        heap.swapAt(0, heap.count - 1)
        let value = heap.removeLast()
        if !heap.isEmpty {
            siftDown(from: 0)
        }
        return value
    }

    func peek() -> Element? {
        heap.first
    }

    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && areInIncreasingOrder(heap[child], heap[parent]) {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }

    private mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent
            if left < heap.count && areInIncreasingOrder(heap[left], heap[candidate]) {
                candidate = left
            }
            if right < heap.count && areInIncreasingOrder(heap[right], heap[candidate]) {
                candidate = right
            }
            if candidate == parent { return }
            heap.swapAt(parent, candidate)
            parent = candidate
        }
    }
}

var minHeap = PriorityQueue<Int>(sort: <)
for value in [5, 1, 9, 3, 7] {
    minHeap.push(value)
}
var sorted: [Int] = []
while let next = minHeap.pop() {
    sorted.append(next)
}
print(sorted) // [1, 3, 5, 7, 9]
