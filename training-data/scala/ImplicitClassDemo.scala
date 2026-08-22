object ImplicitClassDemo {
  implicit class RichInt(val n: Int) {
    def isPrime: Boolean = {
      if (n < 2) false
      else !(2 to math.sqrt(n).toInt).exists(n % _ == 0)
    }
  }

  def main(args: Array[String]): Unit = {
    println((2 to 20).filter(_.isPrime).toList)
  }
}
