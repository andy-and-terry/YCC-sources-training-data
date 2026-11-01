trait Base { def who = "base" }
trait A extends Base { override def who = "A>" + super.who }
trait B extends Base { override def who = "B>" + super.who }

object TraitLinearizationEx extends App {
  class C extends A with B
  println(new C().who)
}
