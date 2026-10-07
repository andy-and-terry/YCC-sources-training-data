import std.stdio;

interface DiscountStrategy {
    double apply(double total);
}

class NoDiscount : DiscountStrategy {
    double apply(double total) { return total; }
}

class PercentageDiscount : DiscountStrategy {
    private double percent;
    this(double percent) { this.percent = percent; }
    double apply(double total) { return total - (total * percent / 100.0); }
}

class FlatDiscount : DiscountStrategy {
    private double amount;
    this(double amount) { this.amount = amount; }
    double apply(double total) {
        auto result = total - amount;
        return result < 0 ? 0 : result;
    }
}

class Cart {
    private DiscountStrategy strategy;
    this(DiscountStrategy strategy) { this.strategy = strategy; }
    double checkout(double total) { return strategy.apply(total); }
}

void main() {
    writeln(new Cart(new NoDiscount()).checkout(100.0));
    writeln(new Cart(new PercentageDiscount(20.0)).checkout(100.0));
    writeln(new Cart(new FlatDiscount(15.0)).checkout(100.0));
}
