sealed trait Expr
case class Num(n: Int) extends Expr
case class Add(l: Expr, r: Expr) extends Expr
case class Neg(e: Expr) extends Expr

object Calc extends App {
  def eval(e: Expr): Int = e match {
    case Num(n)    => n
    case Add(l, r) => eval(l) + eval(r)
    case Neg(x)    => -eval(x)
  }
  println(eval(Add(Num(5), Neg(Num(2)))))
}
