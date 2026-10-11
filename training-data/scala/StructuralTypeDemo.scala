import scala.language.reflectiveCalls

object StructuralTypeDemo {
  def closeQuietly(r: { def close(): Unit }): Unit = {
    try r.close()
    catch { case _: Exception => println("ignored error") }
  }

  class Conn { def close(): Unit = println("conn closed") }
  class Bad { def close(): Unit = throw new RuntimeException("boom") }

  def nameOf(x: { val name: String }): String = x.name

  case class Dog(name: String)
  class Robot { val name = "R2" }

  def main(args: Array[String]): Unit = {
    closeQuietly(new Conn)
    closeQuietly(new Bad)
    println(nameOf(Dog("Rex")))
    println(nameOf(new Robot))
  }
}
