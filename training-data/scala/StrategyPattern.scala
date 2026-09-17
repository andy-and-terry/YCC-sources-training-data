trait DiscountStrategy {
  def apply(total: Double): Double
}

object NoDiscount extends DiscountStrategy {
  def apply(total: Double): Double = total
}

object TenPercentOff extends DiscountStrategy {
  def apply(total: Double): Double = total * 0.9
}

class FlatAmountOff(amount: Double) extends DiscountStrategy {
  def apply(total: Double): Double = math.max(0.0, total - amount)
}

class Checkout(var strategy: DiscountStrategy) {
  def total(cartTotal: Double): Double = strategy.apply(cartTotal)
}

object StrategyPattern {
  def main(args: Array[String]): Unit = {
    val checkout = new Checkout(NoDiscount)
    println(checkout.total(100.0))

    checkout.strategy = TenPercentOff
    println(checkout.total(100.0))

    checkout.strategy = new FlatAmountOff(15.0)
    println(checkout.total(100.0))
  }
}
