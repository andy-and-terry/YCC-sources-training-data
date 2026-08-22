import scala.collection.mutable

object ValidParentheses {
  def isValid(s: String): Boolean = {
    val stack = mutable.Stack[Char]()
    val pairs = Map(')' -> '(', ']' -> '[', '}' -> '{')
    for (ch <- s) {
      if (pairs.values.toSet.contains(ch)) {
        stack.push(ch)
      } else if (pairs.contains(ch)) {
        if (stack.isEmpty || stack.pop() != pairs(ch)) return false
      }
    }
    stack.isEmpty
  }

  def main(args: Array[String]): Unit = {
    println(isValid("({[]})"))
    println(isValid("(]"))
  }
}
