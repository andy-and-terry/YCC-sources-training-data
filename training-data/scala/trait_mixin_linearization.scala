trait Greeter { def greet: String = "hello" }
trait Loud extends Greeter { override def greet: String = super.greet.toUpperCase + "!" }
class Person extends Greeter with Loud

object Mixin extends App {
  println(new Person().greet)
}
