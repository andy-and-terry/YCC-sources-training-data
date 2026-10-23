object LazyValInitOrder {
  lazy val expensive: Int = {
    println("computing expensive")
    42
  }

  def main(args: Array[String]): Unit = {
    println("before first use")
    println(expensive)
    println(expensive) // not recomputed
  }
}
