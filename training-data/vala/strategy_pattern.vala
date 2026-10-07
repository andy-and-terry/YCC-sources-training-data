interface DiscountStrategy : Object {
    public abstract double apply(double amount);
}

class NoDiscount : Object, DiscountStrategy {
    public double apply(double amount) {
        return amount;
    }
}

class PercentageDiscount : Object, DiscountStrategy {
    double percent;

    public PercentageDiscount(double percent) {
        this.percent = percent;
    }

    public double apply(double amount) {
        return amount - amount * percent / 100.0;
    }
}

class FlatDiscount : Object, DiscountStrategy {
    double flat;

    public FlatDiscount(double flat) {
        this.flat = flat;
    }

    public double apply(double amount) {
        double result = amount - flat;
        return result < 0 ? 0 : result;
    }
}

class Cart : Object {
    public DiscountStrategy strategy;

    public Cart(DiscountStrategy strategy) {
        this.strategy = strategy;
    }

    public double total(double amount) {
        return strategy.apply(amount);
    }
}

void main() {
    var cart = new Cart(new NoDiscount());
    stdout.printf("%.2f\n", cart.total(100.0));

    cart.strategy = new PercentageDiscount(20.0);
    stdout.printf("%.2f\n", cart.total(100.0));

    cart.strategy = new FlatDiscount(15.0);
    stdout.printf("%.2f\n", cart.total(100.0));
}
