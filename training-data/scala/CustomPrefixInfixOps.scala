object CustomPrefixInfixOps {
  case class Vec(x: Int, y: Int) {
    def +(o: Vec): Vec = Vec(x + o.x, y + o.y)
    def *(k: Int): Vec = Vec(x * k, y * k)
    def unary_- : Vec = Vec(-x, -y)
    def unary_! : Boolean = x == 0 && y == 0
    def dot(o: Vec): Int = x * o.x + y * o.y
    def ~>(o: Vec): Vec = o + -this
  }

  def main(args: Array[String]): Unit = {
    val a = Vec(1, 2)
    val b = Vec(3, 4)
    println(a + b)
    println(a * 3)
    println(-a)
    println(!Vec(0, 0))
    println(a dot b)
    println(a ~> b)
    println(a + b * 2)
  }
}
