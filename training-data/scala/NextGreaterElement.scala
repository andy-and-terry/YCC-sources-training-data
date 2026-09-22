import scala.collection.mutable

object NextGreaterElement {
  def nextGreater(arr: Array[Int]): Array[Int] = {
    val result = Array.fill(arr.length)(-1)
    val stack = mutable.Stack[Int]()

    for (i <- arr.indices) {
      while (stack.nonEmpty && arr(stack.top) < arr(i)) {
        result(stack.pop()) = arr(i)
      }
      stack.push(i)
    }
    result
  }

  def main(args: Array[String]): Unit = {
    val arr = Array(4, 5, 2, 10, 8)
    println(nextGreater(arr).toList)
  }
}
