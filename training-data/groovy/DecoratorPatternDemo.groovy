interface Coffee {
    double cost()
    String description()
}

class SimpleCoffee implements Coffee {
    double cost() { return 2.0 }
    String description() { return "Coffee" }
}

abstract class CoffeeDecorator implements Coffee {
    protected Coffee wrapped

    CoffeeDecorator(Coffee coffee) {
        wrapped = coffee
    }
}

class MilkDecorator extends CoffeeDecorator {
    MilkDecorator(Coffee coffee) { super(coffee) }
    double cost() { return wrapped.cost() + 0.5 }
    String description() { return wrapped.description() + " + Milk" }
}

class SugarDecorator extends CoffeeDecorator {
    SugarDecorator(Coffee coffee) { super(coffee) }
    double cost() { return wrapped.cost() + 0.25 }
    String description() { return wrapped.description() + " + Sugar" }
}

Coffee order = new SugarDecorator(new MilkDecorator(new SimpleCoffee()))
println "${order.description()}: \$${order.cost()}"
