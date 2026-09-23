import std.stdio;

interface Coffee {
    double cost();
    string description();
}

class SimpleCoffee : Coffee {
    double cost() { return 2.0; }
    string description() { return "coffee"; }
}

abstract class CoffeeDecorator : Coffee {
    protected Coffee inner;
    this(Coffee inner) { this.inner = inner; }
}

class MilkDecorator : CoffeeDecorator {
    this(Coffee inner) { super(inner); }
    override double cost() { return inner.cost() + 0.5; }
    override string description() { return inner.description() ~ " + milk"; }
}

class SugarDecorator : CoffeeDecorator {
    this(Coffee inner) { super(inner); }
    override double cost() { return inner.cost() + 0.25; }
    override string description() { return inner.description() ~ " + sugar"; }
}

void main() {
    Coffee order = new SugarDecorator(new MilkDecorator(new SimpleCoffee()));
    writeln(order.description(), " = ", order.cost());
}
