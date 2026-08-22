struct Stack<Element> {
    private var elements: [Element] = []

    mutating func push(_ value: Element) {
        elements.append(value)
    }

    mutating func pop() -> Element? {
        elements.popLast()
    }

    func peek() -> Element? {
        elements.last
    }

    var isEmpty: Bool {
        elements.isEmpty
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
intStack.push(3)
print(intStack.pop() ?? -1)
print(intStack.peek() ?? -1)

var stringStack = Stack<String>()
stringStack.push("a")
stringStack.push("b")
print(stringStack.pop() ?? "")
