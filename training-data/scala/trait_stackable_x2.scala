trait Greeter { def greet: String = "hello" }
trait Loud extends Greeter { override def greet: String = super.greet.toUpperCase + "!" }
object TraitStackableX2 extends App {
  println((new Greeter with Loud).greet)
}
