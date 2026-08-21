struct Stack<T> {
    private var items: [T] = []

    mutating func push(_ item: T) {
        items.append(item)
    }

    mutating func pop() -> T? {
        items.popLast()
    }

    func peek() -> T? {
        items.last
    }

    var isEmpty: Bool {
        items.isEmpty
    }
}

var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
print(stack.pop() ?? -1, stack.peek() ?? -1, stack.isEmpty)
