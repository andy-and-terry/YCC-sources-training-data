struct Stack<Element> {
    private var items: [Element] = []
    mutating func push(_ x: Element) { items.append(x) }
    mutating func pop() -> Element? { items.popLast() }
    var peek: Element? { items.last }
    var isEmpty: Bool { items.isEmpty }
}

var s = Stack<String>()
s.push("a"); s.push("b")
print(s.pop() ?? "-", s.peek ?? "-", s.isEmpty)
