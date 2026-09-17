trait DiscountStrategy {
  def applyDiscount(price: Double): Double
}

object NoDiscount extends DiscountStrategy {
  def applyDiscount(price: Double): Double = price
}

object TenPercentOff extends DiscountStrategy {
  def applyDiscount(price: Double): Double = price * 0.9
}

class FlatAmountOff(amount: Double) extends DiscountStrategy {
  def applyDiscount(price: Double): Double = math.max(0.0, price - amount)
}

class Checkout(var strategy: DiscountStrategy) {
  def total(price: Double): Double = strategy.applyDiscount(price)
}

object StrategyPatternDemo {
  def main(args: Array[String]): Unit = {
    val checkout = new Checkout(NoDiscount)
    println(checkout.total(100.0))
    checkout.strategy = TenPercentOff
    println(checkout.total(100.0))
    checkout.strategy = new FlatAmountOff(15.0)
    println(checkout.total(100.0))
  }
}
