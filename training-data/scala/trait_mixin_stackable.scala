trait Logger { def log(s: String): Unit = println(s) }
trait Timestamped extends Logger { override def log(s: String): Unit = super.log(s"[t0] $s") }
trait Upper extends Logger { override def log(s: String): Unit = super.log(s.toUpperCase) }

object Mixins extends App {
  val l = new Logger with Timestamped with Upper
  l.log("hello")
}
