abstract class Coffee : Object {
    public abstract double cost();
    public abstract string description();
}

class PlainCoffee : Coffee {
    public override double cost() {
        return 2.0;
    }

    public override string description() {
        return "Coffee";
    }
}

abstract class CoffeeDecorator : Coffee {
    protected Coffee wrapped;

    protected CoffeeDecorator(Coffee wrapped) {
        this.wrapped = wrapped;
    }
}

class MilkDecorator : CoffeeDecorator {
    public MilkDecorator(Coffee wrapped) {
        base(wrapped);
    }

    public override double cost() {
        return wrapped.cost() + 0.5;
    }

    public override string description() {
        return wrapped.description() + " + Milk";
    }
}

class SugarDecorator : CoffeeDecorator {
    public SugarDecorator(Coffee wrapped) {
        base(wrapped);
    }

    public override double cost() {
        return wrapped.cost() + 0.25;
    }

    public override string description() {
        return wrapped.description() + " + Sugar";
    }
}

void main() {
    Coffee order = new PlainCoffee();
    order = new MilkDecorator(order);
    order = new SugarDecorator(order);

    stdout.printf("%s: $%.2f\n", order.description(), order.cost());
}
