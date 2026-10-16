import scala.collection.mutable.ArrayBuffer

object ArrayBufferDemo {
  def main(args: Array[String]): Unit = {
    val buf = ArrayBuffer(10, 20, 30)
    buf += 40
    buf ++= List(50, 60)
    buf.prepend(5)
    println(buf)

    buf.remove(0)
    buf -= 30
    println(buf)

    buf.insert(2, 99)
    buf(0) = 11
    println(buf)

    buf.filterInPlace(_ % 2 == 0)
    println(buf)
    println(buf.toList.map(_ / 2))
    buf.clear()
    println(buf.isEmpty)
  }
}
