object StringInterpolationDemo {
  case class Item(name: String, price: Double, qty: Int)

  def main(args: Array[String]): Unit = {
    val name = "Ada"
    val age = 36
    println(s"$name is $age; next year ${age + 1}")
    println(f"pi ~ ${math.Pi}%.3f, padded: ${42}%06d, left: ${"ab"}%-5s|")
    println(raw"no\nescape here: $name")

    val items = List(Item("pen", 1.5, 10), Item("notebook", 12.25, 2), Item("bag", 40.0, 1))
    items.foreach(i => println(f"${i.name}%-10s ${i.price}%8.2f x ${i.qty}%2d"))
    println(f"total: ${items.map(i => i.price * i.qty).sum}%.2f")

    val multi =
      """|line one
         |  line two with "quotes"
         |line three""".stripMargin
    println(multi)

    implicit class Shout(sc: StringContext) {
      def shout(args: Any*): String = sc.s(args: _*).toUpperCase
    }
    println(shout"hello $name")
  }
}
