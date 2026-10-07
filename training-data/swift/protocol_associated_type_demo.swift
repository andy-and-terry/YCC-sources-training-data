protocol Container {
    associatedtype Item
    var items: [Item] { get }
    mutating func add(_ item: Item)
}

extension Container {
    var count: Int { items.count }
}

struct Stack<Element>: Container {
    private(set) var items: [Element] = []

    mutating func add(_ item: Element) {
        items.append(item)
    }
}

private class AnyContainerBase<Item> {
    var items: [Item] { fatalError("must override") }
    func add(_ item: Item) { fatalError("must override") }
}

private final class ContainerBox<C: Container>: AnyContainerBase<C.Item> {
    var base: C

    init(_ base: C) {
        self.base = base
    }

    override var items: [C.Item] { base.items }

    override func add(_ item: C.Item) {
        base.add(item)
    }
}

struct AnyContainer<Item> {
    private let box: AnyContainerBase<Item>

    init<C: Container>(_ container: C) where C.Item == Item {
        box = ContainerBox(container)
    }

    var items: [Item] { box.items }

    func add(_ item: Item) {
        box.add(item)
    }
}

var intStack = Stack<Int>()
intStack.add(1)
intStack.add(2)

var stringStack = Stack<String>()
stringStack.add("hello")

let boxedInts = AnyContainer(intStack)
boxedInts.add(3)
print(boxedInts.items)

let boxedStrings = AnyContainer(stringStack)
print(boxedStrings.items)
