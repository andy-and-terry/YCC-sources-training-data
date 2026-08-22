object LazyValDemo {
  def expensiveComputation(): Int = {
    println("computing...")
    42
  }

  def main(args: Array[String]): Unit = {
    lazy val value = expensiveComputation()
    println("before access")
    println(value)
    println(value)
  }
}
