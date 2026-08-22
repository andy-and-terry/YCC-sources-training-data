final class ListNode {
    var value: Int
    var next: ListNode?

    init(_ value: Int) {
        self.value = value
    }
}

final class LinkedList {
    private var head: ListNode?

    func push(_ value: Int) {
        let node = ListNode(value)
        if head == nil {
            head = node
            return
        }
        var cur = head
        while cur?.next != nil {
            cur = cur?.next
        }
        cur?.next = node
    }

    func reversed() -> [Int] {
        var prev: ListNode? = nil
        var cur = head
        while cur != nil {
            let next = cur?.next
            cur?.next = prev
            prev = cur
            cur = next
        }
        head = prev
        var result: [Int] = []
        var node = head
        while node != nil {
            result.append(node!.value)
            node = node?.next
        }
        return result
    }
}

let list = LinkedList()
[1, 2, 3, 4].forEach { list.push($0) }
print(list.reversed())
