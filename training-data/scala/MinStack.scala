class MinStack {
  private var stack = List[Int]()
  private var minStack = List[Int]()

  def push(x: Int): Unit = {
    stack = x :: stack
    val newMin = minStack.headOption.fold(x)(m => math.min(m, x))
    minStack = newMin :: minStack
  }

  def pop(): Unit = {
    stack = stack.tail
    minStack = minStack.tail
  }

  def top: Int = stack.head

  def min: Int = minStack.head
}

object MinStackDemo {
  def main(args: Array[String]): Unit = {
    val s = new MinStack
    s.push(5)
    s.push(2)
    s.push(7)
    println(s.min)
    s.pop()
    println(s.min)
    println(s.top)
  }
}
