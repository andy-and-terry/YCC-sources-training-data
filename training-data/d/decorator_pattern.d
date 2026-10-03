import std.stdio;

interface Coffee {
    double cost();
    string description();
}

class SimpleCoffee : Coffee {
    double cost() { return 2.0; }
    string description() { return "coffee"; }
}

class MilkDecorator : Coffee {
    private Coffee wrapped;

    this(Coffee wrapped) {
        this.wrapped = wrapped;
    }

    double cost() { return wrapped.cost() + 0.5; }
    string description() { return wrapped.description() ~ " + milk"; }
}

void main() {
    Coffee coffee = new MilkDecorator(new SimpleCoffee());
    writeln(coffee.description(), " costs ", coffee.cost());
}
