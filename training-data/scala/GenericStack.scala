class Stack[T] {
  private var items: List[T] = Nil

  def push(item: T): Unit = items = item :: items

  def pop(): Option[T] = items match {
    case Nil => None
    case head :: tail =>
      items = tail
      Some(head)
  }

  def peek(): Option[T] = items.headOption

  def isEmpty: Boolean = items.isEmpty
}

object GenericStackDemo {
  def main(args: Array[String]): Unit = {
    val intStack = new Stack[Int]
    intStack.push(1)
    intStack.push(2)
    intStack.push(3)
    println(intStack.pop())
    println(intStack.peek())
  }
}
