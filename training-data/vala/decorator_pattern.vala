interface Beverage : Object {
    public abstract double cost();
    public abstract string description();
}

class PlainCoffee : Object, Beverage {
    public double cost() {
        return 2.0;
    }
    public string description() {
        return "coffee";
    }
}

abstract class BeverageDecorator : Object, Beverage {
    protected Beverage wrapped;
    protected BeverageDecorator(Beverage wrapped) {
        this.wrapped = wrapped;
    }
    public abstract double cost();
    public abstract string description();
}

class WithMilk : BeverageDecorator {
    public WithMilk(Beverage wrapped) {
        base(wrapped);
    }
    public override double cost() {
        return wrapped.cost() + 0.5;
    }
    public override string description() {
        return wrapped.description() + ", milk";
    }
}

class WithSugar : BeverageDecorator {
    public WithSugar(Beverage wrapped) {
        base(wrapped);
    }
    public override double cost() {
        return wrapped.cost() + 0.25;
    }
    public override string description() {
        return wrapped.description() + ", sugar";
    }
}

void main() {
    Beverage drink = new WithSugar(new WithMilk(new PlainCoffee()));
    stdout.printf("%s: $%.2f\n", drink.description(), drink.cost());
}
