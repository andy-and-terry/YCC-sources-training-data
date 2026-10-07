sealed trait Expression {
  def interpret(context: Map[String, Int]): Int
}

case class Number(value: Int) extends Expression {
  def interpret(context: Map[String, Int]): Int = value
}

case class Variable(name: String) extends Expression {
  def interpret(context: Map[String, Int]): Int = context(name)
}

case class Add(left: Expression, right: Expression) extends Expression {
  def interpret(context: Map[String, Int]): Int = left.interpret(context) + right.interpret(context)
}

case class Multiply(left: Expression, right: Expression) extends Expression {
  def interpret(context: Map[String, Int]): Int = left.interpret(context) * right.interpret(context)
}

object InterpreterPattern {
  def main(args: Array[String]): Unit = {
    // Represents: (x + 3) * y
    val expr = Multiply(Add(Variable("x"), Number(3)), Variable("y"))
    println(expr.interpret(Map("x" -> 2, "y" -> 5)))
  }
}
