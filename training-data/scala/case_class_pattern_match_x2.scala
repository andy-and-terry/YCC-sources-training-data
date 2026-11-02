sealed trait Expr
case class Num(n: Int) extends Expr
case class Add(a: Expr, b: Expr) extends Expr
case class Mul(a: Expr, b: Expr) extends Expr

object CaseClassPatternMatchX2 extends App {
  def eval(e: Expr): Int = e match {
    case Num(n) => n
    case Add(a, b) => eval(a) + eval(b)
    case Mul(a, b) => eval(a) * eval(b)
  }
  println(eval(Add(Num(2), Mul(Num(3), Num(4)))))
}
