fun interface DiscountStrategy {
    fun apply(price: Double): Double
}

class NoDiscount : DiscountStrategy {
    override fun apply(price: Double) = price
}

class PercentageDiscount(private val percent: Double) : DiscountStrategy {
    override fun apply(price: Double) = price * (1 - percent / 100)
}

class FlatDiscount(private val amount: Double) : DiscountStrategy {
    override fun apply(price: Double) = (price - amount).coerceAtLeast(0.0)
}

class Checkout(private var strategy: DiscountStrategy) {
    fun setStrategy(strategy: DiscountStrategy) {
        this.strategy = strategy
    }

    fun total(price: Double): Double = strategy.apply(price)
}

fun main() {
    val checkout = Checkout(NoDiscount())
    println(checkout.total(100.0))

    checkout.setStrategy(PercentageDiscount(20.0))
    println(checkout.total(100.0))

    checkout.setStrategy(FlatDiscount(15.0))
    println(checkout.total(100.0))

    checkout.setStrategy { price -> price / 2 }
    println(checkout.total(100.0))
}
