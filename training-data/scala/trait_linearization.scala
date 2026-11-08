trait A { def hi = "A" }
trait B extends A { override def hi = "B>" + super.hi }
trait C extends A { override def hi = "C>" + super.hi }

object Lin extends App {
  class D extends B with C
  println(new D().hi)
}
