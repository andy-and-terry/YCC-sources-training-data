final class DListNode {
    var value: Int
    var prev: DListNode?
    var next: DListNode?

    init(_ value: Int) {
        self.value = value
    }
}

final class DoublyLinkedList {
    private var head: DListNode?
    private var tail: DListNode?

    func pushBack(_ value: Int) {
        let node = DListNode(value)
        if let last = tail {
            last.next = node
            node.prev = last
            tail = node
        } else {
            head = node
            tail = node
        }
    }

    func pushFront(_ value: Int) {
        let node = DListNode(value)
        if let first = head {
            first.prev = node
            node.next = first
            head = node
        } else {
            head = node
            tail = node
        }
    }

    func popBack() -> Int? {
        guard let last = tail else { return nil }
        tail = last.prev
        tail?.next = nil
        if tail == nil { head = nil }
        return last.value
    }

    func toArray() -> [Int] {
        var result: [Int] = []
        var node = head
        while let current = node {
            result.append(current.value)
            node = current.next
        }
        return result
    }

    func toArrayReversed() -> [Int] {
        var result: [Int] = []
        var node = tail
        while let current = node {
            result.append(current.value)
            node = current.prev
        }
        return result
    }
}

let list = DoublyLinkedList()
list.pushBack(1)
list.pushBack(2)
list.pushBack(3)
list.pushFront(0)
print(list.toArray())          // [0, 1, 2, 3]
print(list.toArrayReversed())  // [3, 2, 1, 0]
print(list.popBack() ?? -1)    // 3
print(list.toArray())          // [0, 1, 2]
