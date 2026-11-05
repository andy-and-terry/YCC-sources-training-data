trait Base { def say: String = "base" }
trait Loud extends Base { override def say: String = super.say.toUpperCase }
trait Exclaim extends Base { override def say: String = super.say + "!" }

object Mixins extends App {
  class A extends Base with Loud with Exclaim
  class B extends Base with Exclaim with Loud
  println(new A().say)
  println(new B().say)
}
