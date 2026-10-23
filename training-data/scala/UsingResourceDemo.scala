import scala.util.{Failure, Success, Using}

class Resource(val name: String) extends AutoCloseable {
  println(s"open $name")
  def read(): String = s"data from $name"
  def fail(): Nothing = throw new RuntimeException(s"$name failed")
  override def close(): Unit = println(s"close $name")
}

object UsingResourceDemo {
  def main(args: Array[String]): Unit = {
    val result = Using(new Resource("A")) { r => r.read().toUpperCase }
    println(result)

    val failed = Using(new Resource("B")) { r => r.fail() }
    failed match {
      case Success(v)  => println(s"ok $v")
      case Failure(ex) => println(s"caught: ${ex.getMessage}")
    }

    // Several resources are closed in reverse order of opening.
    val both = Using.Manager { use =>
      val first = use(new Resource("first"))
      val second = use(new Resource("second"))
      first.read() + " + " + second.read()
    }
    println(both.get)

    println(Using.resource(new Resource("C"))(_.read().length))
  }
}
