// Operator precedence in Scala is decided by the first character of the
// method name, and operators ending in ':' are right associative.
case class Vec(x: Int, y: Int) {
  def +(o: Vec): Vec = Vec(x + o.x, y + o.y)
  def *(k: Int): Vec = Vec(x * k, y * k)
  def ::>(o: Vec): String = s"$this then $o"
  def unary_- : Vec = Vec(-x, -y)
}

class Stack(val items: List[Int]) {
  // Ends with ':' so this is right associative: x +: stack == stack.+:(x)
  def +:(x: Int): Stack = new Stack(x :: items)
  override def toString = items.mkString("Stack(", ", ", ")")
}

object SymbolicOperatorPrecedenceDemo extends App {
  val a = Vec(1, 2)
  val b = Vec(3, 4)

  // '*' binds tighter than '+'
  println(a + b * 2)
  println((a + b) * 2)
  println(-a)

  // Alphanumeric method used infix has the lowest precedence.
  println(1 + 2 max 10)

  val s = 1 +: 2 +: 3 +: new Stack(Nil)
  println(s)

  println(a ::> b)

  // Right-associative list cons
  val xs = 1 :: 2 :: 3 :: Nil
  println(xs)
  println(0 :: xs ::: List(9))
}
