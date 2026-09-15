protocol DiscountStrategy {
    func apply(to price: Double) -> Double
}

struct NoDiscount: DiscountStrategy {
    func apply(to price: Double) -> Double { price }
}

struct PercentageDiscount: DiscountStrategy {
    let percent: Double
    func apply(to price: Double) -> Double { price * (1 - percent / 100) }
}

struct FlatDiscount: DiscountStrategy {
    let amount: Double
    func apply(to price: Double) -> Double { max(0, price - amount) }
}

final class ShoppingCart {
    private var strategy: DiscountStrategy

    init(strategy: DiscountStrategy) {
        self.strategy = strategy
    }

    func setStrategy(_ strategy: DiscountStrategy) {
        self.strategy = strategy
    }

    func checkout(_ price: Double) -> Double {
        strategy.apply(to: price)
    }
}

let cart = ShoppingCart(strategy: NoDiscount())
print(cart.checkout(100))

cart.setStrategy(PercentageDiscount(percent: 20))
print(cart.checkout(100))

cart.setStrategy(FlatDiscount(amount: 15))
print(cart.checkout(100))
