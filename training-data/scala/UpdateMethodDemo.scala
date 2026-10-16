object UpdateMethodDemo {
  class Grid(w: Int, h: Int) {
    private val cells = Array.fill(w * h)('.')
    def apply(x: Int, y: Int): Char = cells(y * w + x)
    def update(x: Int, y: Int, c: Char): Unit = cells(y * w + x) = c
    override def toString = cells.grouped(w).map(_.mkString).mkString("\n")
  }

  def main(args: Array[String]): Unit = {
    val g = new Grid(4, 3)
    g(1, 1) = '#'
    g(3, 0) = '@'
    g(0, 2) = '*'
    println(g)
    println(g(1, 1))
  }
}
