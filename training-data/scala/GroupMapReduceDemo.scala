object GroupMapReduceDemo {
  case class Sale(region: String, product: String, amount: Int)

  def main(args: Array[String]): Unit = {
    val sales = List(
      Sale("north", "tea", 10), Sale("south", "tea", 7),
      Sale("north", "coffee", 20), Sale("south", "coffee", 5),
      Sale("north", "tea", 3)
    )

    val byRegion = sales.groupBy(_.region)
    byRegion.toList.sortBy(_._1).foreach { case (r, xs) => println(s"$r -> ${xs.size} sales") }

    val totals = sales.groupMapReduce(_.region)(_.amount)(_ + _)
    println(totals.toList.sorted)

    val productNames = sales.groupMap(_.region)(_.product).view.mapValues(_.distinct).toMap
    println(productNames("north"))

    val (big, small) = sales.partition(_.amount >= 10)
    println(s"big=${big.size} small=${small.size}")

    println(sales.maxBy(_.amount))
    println(sales.map(_.amount).foldLeft((0, 0)) { case ((s, c), x) => (s + x, c + 1) })
    println(sales.distinctBy(_.product).map(_.product))
    val (lead, rest) = sales.span(_.region == "north")
    println(s"lead=${lead.size} rest=${rest.size}")
  }
}
