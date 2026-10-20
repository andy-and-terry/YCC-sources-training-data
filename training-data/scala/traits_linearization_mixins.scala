object TraitsLinearizationMixins {
  trait Logger { def log(m: String): Unit = println(s"[log] $m") }
  trait Timestamped extends Logger { override def log(m: String): Unit = super.log(s"t0 $m") }
  trait Shouting extends Logger { override def log(m: String): Unit = super.log(m.toUpperCase) }

  class Service extends Logger
  class A extends Service with Timestamped with Shouting
  class B extends Service with Shouting with Timestamped

  abstract class Animal(val name: String) { def sound: String; override def toString = s"$name says $sound" }
  class Dog(n: String) extends Animal(n) { def sound = "woof" }

  def main(args: Array[String]): Unit = {
    new A().log("hello")
    new B().log("hello")
    println(new Dog("rex"))
    val anon = new Logger { override def log(m: String) = println(s">> $m") }
    anon.log("anon")
  }
}
