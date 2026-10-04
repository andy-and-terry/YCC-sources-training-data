object StringInterpolationDemo {
  case class Item(name: String, price: Double, qty: Int)

  def main(args: Array[String]): Unit = {
    val name = "Scala"
    val version = 2.13
    println(s"Hello, $name $version")
    println(s"Sum: ${1 + 2 + 3}")

    val item = Item("widget", 4.5, 3)
    println(s"${item.name} costs ${item.price} x ${item.qty}")
    println(f"Total: ${item.price * item.qty}%.2f")
    println(f"${item.name}%-10s|${item.qty}%5d|")

    println(raw"no\nescape: $name")
    println("with\nescape")

    val multi =
      s"""|Name: ${item.name}
          |Qty:  ${item.qty}""".stripMargin
    println(multi)

    println(s"Dollar sign: $$5")
  }
}
