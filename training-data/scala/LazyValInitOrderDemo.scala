object LazyValInitOrderDemo {
  class Config {
    val first: String = "first=" + second.getOrElse("null")
    lazy val second: Option[String] = Some("ready")
    val third: String = "third=" + fourth
    val fourth: String = "late"
  }

  class Cache {
    private var hits = 0
    lazy val table: Map[Int, Int] = {
      hits += 1
      println("building table")
      (1 to 5).map(n => n -> n * n).toMap
    }
    def lookup(n: Int): Option[Int] = table.get(n)
    def buildCount: Int = hits
  }

  def main(args: Array[String]): Unit = {
    val c = new Config
    println(c.first)
    println(c.third) // fourth was still null when third was initialised

    val cache = new Cache
    println(cache.buildCount)
    println(cache.lookup(3))
    println(cache.lookup(9))
    println(cache.buildCount)

    val view = (1 to 5).view.map { n => println(s"mapping $n"); n * 2 }
    println(view.take(2).toList)

    val ll = LazyList.from(1).map(_ * 3).filter(_ % 2 == 0)
    println(ll.take(4).toList)
  }
}
