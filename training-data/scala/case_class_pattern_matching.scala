sealed trait Expr
case class Num(v: Double) extends Expr
case class Add(l: Expr, r: Expr) extends Expr
case class Mul(l: Expr, r: Expr) extends Expr
case class Neg(e: Expr) extends Expr

object CaseClassPatternMatching {
  def eval(e: Expr): Double = e match {
    case Num(v)           => v
    case Add(l, r)        => eval(l) + eval(r)
    case Mul(Num(0), _)   => 0
    case Mul(l, r)        => eval(l) * eval(r)
    case Neg(Neg(inner))  => eval(inner)
    case Neg(inner)       => -eval(inner)
  }

  def main(args: Array[String]): Unit = {
    println(eval(Add(Num(2), Mul(Num(3), Neg(Num(4))))))
    println(eval(Neg(Neg(Num(5)))))
  }
}
