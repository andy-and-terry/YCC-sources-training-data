protocol Coffee {
    func cost() -> Double
    func description() -> String
}

struct PlainCoffee: Coffee {
    func cost() -> Double { 2.0 }
    func description() -> String { "Coffee" }
}

class CoffeeDecorator: Coffee {
    private let wrapped: Coffee

    init(_ wrapped: Coffee) {
        self.wrapped = wrapped
    }

    func cost() -> Double { wrapped.cost() }
    func description() -> String { wrapped.description() }
}

final class MilkDecorator: CoffeeDecorator {
    override func cost() -> Double { super.cost() + 0.5 }
    override func description() -> String { super.description() + " + Milk" }
}

final class SugarDecorator: CoffeeDecorator {
    override func cost() -> Double { super.cost() + 0.25 }
    override func description() -> String { super.description() + " + Sugar" }
}

var order: Coffee = PlainCoffee()
order = MilkDecorator(order)
order = SugarDecorator(order)

print("\(order.description()): $\(order.cost())")
