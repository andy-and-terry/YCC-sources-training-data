import scala.collection.mutable.ListBuffer

object ListBufferBuilder {
  def collatz(start: Int): List[Int] = {
    val out = ListBuffer[Int]()
    var n = start
    while (n != 1) {
      out += n
      n = if (n % 2 == 0) n / 2 else 3 * n + 1
    }
    out += 1
    out.toList
  }

  def main(args: Array[String]): Unit = {
    println(collatz(6))
    println(collatz(27).length)

    val builder = List.newBuilder[String]
    builder += "a"
    builder ++= Seq("b", "c")
    println(builder.result())
  }
}
