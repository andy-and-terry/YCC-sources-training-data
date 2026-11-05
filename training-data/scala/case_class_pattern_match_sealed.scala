sealed trait Expr
case class Num(n: Int) extends Expr
case class Add(a: Expr, b: Expr) extends Expr
case class Neg(e: Expr) extends Expr

object SealedEval extends App {
  def eval(e: Expr): Int = e match {
    case Num(n)    => n
    case Add(a, b) => eval(a) + eval(b)
    case Neg(x)    => -eval(x)
  }
  println(eval(Add(Num(5), Neg(Num(2)))))
}
