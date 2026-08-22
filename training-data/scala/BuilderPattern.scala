case class Pizza(size: String, toppings: List[String])

class PizzaBuilder {
  private var size = "medium"
  private var toppings = List[String]()

  def setSize(s: String): PizzaBuilder = { size = s; this }
  def addTopping(t: String): PizzaBuilder = { toppings = toppings :+ t; this }
  def build(): Pizza = Pizza(size, toppings)
}

object BuilderPatternDemo {
  def main(args: Array[String]): Unit = {
    val pizza = new PizzaBuilder()
      .setSize("large")
      .addTopping("cheese")
      .addTopping("pepperoni")
      .build()
    println(pizza)
  }
}
