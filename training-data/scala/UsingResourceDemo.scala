import scala.util.{Failure, Success, Try, Using}

object UsingResourceDemo {
  class Res(name: String) extends AutoCloseable {
    println(s"open $name")
    def read(): Int = name.length
    def fail(): Int = throw new IllegalStateException(s"$name failed")
    override def close(): Unit = println(s"close $name")
  }

  def main(args: Array[String]): Unit = {
    val ok: Try[Int] = Using(new Res("alpha")) { r => r.read() * 2 }
    println(ok)

    val bad: Try[Int] = Using(new Res("beta")) { r => r.fail() }
    bad match {
      case Success(v)  => println(s"value $v")
      case Failure(ex) => println(s"error: ${ex.getMessage}")
    }

    // Several resources are closed in reverse order of opening
    val both = Using.Manager { use =>
      val first = use(new Res("first"))
      val second = use(new Res("second"))
      first.read() + second.read()
    }
    println(both)
  }
}
