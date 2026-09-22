protocol Coffee {
    func cost() -> Double
    func description() -> String
}

struct SimpleCoffee: Coffee {
    func cost() -> Double { 2.0 }
    func description() -> String { "coffee" }
}

class CoffeeDecorator: Coffee {
    let wrapped: Coffee

    init(_ wrapped: Coffee) {
        self.wrapped = wrapped
    }

    func cost() -> Double { wrapped.cost() }
    func description() -> String { wrapped.description() }
}

final class MilkDecorator: CoffeeDecorator {
    override func cost() -> Double { super.cost() + 0.5 }
    override func description() -> String { "\(super.description()) with milk" }
}

final class SugarDecorator: CoffeeDecorator {
    override func cost() -> Double { super.cost() + 0.25 }
    override func description() -> String { "\(super.description()) with sugar" }
}

var drink: Coffee = SimpleCoffee()
drink = MilkDecorator(drink)
drink = SugarDecorator(drink)

print("\(drink.description()) costs \(drink.cost())")
