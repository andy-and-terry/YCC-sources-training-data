protocol Coffee {
    var cost: Double { get }
    var description: String { get }
}

struct SimpleCoffee: Coffee {
    var cost: Double { 2.0 }
    var description: String { "Coffee" }
}

class CoffeeDecorator: Coffee {
    private let wrapped: Coffee

    init(_ wrapped: Coffee) {
        self.wrapped = wrapped
    }

    var cost: Double { wrapped.cost }
    var description: String { wrapped.description }
}

final class MilkDecorator: CoffeeDecorator {
    private let base: Coffee
    override init(_ wrapped: Coffee) {
        self.base = wrapped
        super.init(wrapped)
    }
    override var cost: Double { base.cost + 0.5 }
    override var description: String { base.description + " + Milk" }
}

final class SyrupDecorator: CoffeeDecorator {
    private let base: Coffee
    override init(_ wrapped: Coffee) {
        self.base = wrapped
        super.init(wrapped)
    }
    override var cost: Double { base.cost + 0.75 }
    override var description: String { base.description + " + Syrup" }
}

var order: Coffee = SimpleCoffee()
order = MilkDecorator(order)
order = SyrupDecorator(order)

print("\(order.description): $\(order.cost)")
