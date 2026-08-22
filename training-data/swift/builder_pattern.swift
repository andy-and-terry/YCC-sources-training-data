struct Pizza {
    var size: String = "medium"
    var toppings: [String] = []
}

final class PizzaBuilder {
    private var pizza = Pizza()

    func setSize(_ size: String) -> PizzaBuilder {
        pizza.size = size
        return self
    }

    func addTopping(_ topping: String) -> PizzaBuilder {
        pizza.toppings.append(topping)
        return self
    }

    func build() -> Pizza {
        pizza
    }
}

let pizza = PizzaBuilder()
    .setSize("large")
    .addTopping("cheese")
    .addTopping("pepperoni")
    .build()

print(pizza)
