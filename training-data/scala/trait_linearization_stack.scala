object Stackable extends App {
  trait Base { def msg: String = "base" }
  trait A extends Base { override def msg = "A(" + super.msg + ")" }
  trait B extends Base { override def msg = "B(" + super.msg + ")" }
  class C extends Base with A with B
  println(new C().msg)
}
