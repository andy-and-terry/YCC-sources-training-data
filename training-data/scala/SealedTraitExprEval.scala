sealed trait Expr
case class Num(value: Int) extends Expr
case class Add(left: Expr, right: Expr) extends Expr
case class Sub(left: Expr, right: Expr) extends Expr
case class Mul(left: Expr, right: Expr) extends Expr

object SealedTraitExprEval {
  def eval(expr: Expr): Int = expr match {
    case Num(value) => value
    case Add(l, r) => eval(l) + eval(r)
    case Sub(l, r) => eval(l) - eval(r)
    case Mul(l, r) => eval(l) * eval(r)
  }

  def main(args: Array[String]): Unit = {
    val expr = Add(Num(3), Mul(Num(4), Sub(Num(10), Num(6))))
    println(eval(expr))
  }
}
