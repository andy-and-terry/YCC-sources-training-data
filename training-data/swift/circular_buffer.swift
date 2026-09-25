struct CircularBuffer<Element> {
    private var storage: [Element?]
    private var writeIndex = 0
    private var count = 0

    init(capacity: Int) {
        storage = [Element?](repeating: nil, count: capacity)
    }

    var isFull: Bool { count == storage.count }
    var isEmpty: Bool { count == 0 }

    mutating func write(_ element: Element) {
        storage[writeIndex] = element
        writeIndex = (writeIndex + 1) % storage.count
        if count < storage.count {
            count += 1
        }
    }

    func snapshot() -> [Element] {
        guard count > 0 else { return [] }
        let startIndex = (writeIndex - count + storage.count) % storage.count
        return (0..<count).compactMap { storage[(startIndex + $0) % storage.count] }
    }
}

var buffer = CircularBuffer<Int>(capacity: 3)
buffer.write(1)
buffer.write(2)
print(buffer.snapshot())

buffer.write(3)
buffer.write(4)
print(buffer.snapshot())
print(buffer.isFull)
