interface DiscountStrategy {
    double apply(double price)
}

class NoDiscount implements DiscountStrategy {
    double apply(double price) { return price }
}

class PercentageDiscount implements DiscountStrategy {
    double percent

    PercentageDiscount(double p) {
        percent = p
    }

    double apply(double price) {
        return price * (1 - percent / 100)
    }
}

class FlatDiscount implements DiscountStrategy {
    double amount

    FlatDiscount(double a) {
        amount = a
    }

    double apply(double price) {
        return Math.max(0, price - amount)
    }
}

class Checkout {
    DiscountStrategy strategy

    Checkout(DiscountStrategy s) {
        strategy = s
    }

    double total(double price) {
        return strategy.apply(price)
    }
}

println new Checkout(new NoDiscount()).total(100)
println new Checkout(new PercentageDiscount(20)).total(100)
println new Checkout(new FlatDiscount(15)).total(100)
