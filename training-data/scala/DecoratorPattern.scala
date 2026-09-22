trait Coffee {
  def cost: Double
  def description: String
}

class SimpleCoffee extends Coffee {
  def cost: Double = 2.0
  def description: String = "coffee"
}

abstract class CoffeeDecorator(inner: Coffee) extends Coffee {
  def cost: Double = inner.cost
  def description: String = inner.description
}

class WithMilk(inner: Coffee) extends CoffeeDecorator(inner) {
  override def cost: Double = inner.cost + 0.5
  override def description: String = s"${inner.description} + milk"
}

class WithSugar(inner: Coffee) extends CoffeeDecorator(inner) {
  override def cost: Double = inner.cost + 0.25
  override def description: String = s"${inner.description} + sugar"
}

class WithWhippedCream(inner: Coffee) extends CoffeeDecorator(inner) {
  override def cost: Double = inner.cost + 0.75
  override def description: String = s"${inner.description} + whipped cream"
}

object DecoratorPatternDemo {
  def main(args: Array[String]): Unit = {
    val plain: Coffee = new SimpleCoffee
    val fancy: Coffee = new WithWhippedCream(new WithMilk(new WithSugar(plain)))

    println(s"${plain.description}: $$${plain.cost}")
    println(s"${fancy.description}: $$${fancy.cost}")
  }
}
