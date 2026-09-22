final class PriorityQueue {
    private var heap: [Int] = []

    var isEmpty: Bool { heap.isEmpty }

    func push(_ value: Int) {
        heap.append(value)
        var i = heap.count - 1
        while i > 0 {
            let parent = (i - 1) / 2
            if heap[parent] <= heap[i] { break }
            heap.swapAt(parent, i)
            i = parent
        }
    }

    func pop() -> Int? {
        guard !heap.isEmpty else { return nil }
        let top = heap[0]
        let last = heap.removeLast()
        if !heap.isEmpty {
            heap[0] = last
            var i = 0
            while true {
                let left = 2 * i + 1
                let right = 2 * i + 2
                var smallest = i
                if left < heap.count && heap[left] < heap[smallest] { smallest = left }
                if right < heap.count && heap[right] < heap[smallest] { smallest = right }
                if smallest == i { break }
                heap.swapAt(smallest, i)
                i = smallest
            }
        }
        return top
    }
}

let pq = PriorityQueue()
for v in [5, 3, 8, 1, 9, 2] {
    pq.push(v)
}

var sorted: [Int] = []
while let v = pq.pop() {
    sorted.append(v)
}
print(sorted)
