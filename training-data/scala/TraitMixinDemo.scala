trait Flyable {
  def fly(): String = "flying"
}

trait Swimmable {
  def swim(): String = "swimming"
}

class Duck extends Flyable with Swimmable {
  def describe(): String = s"Duck is ${fly()} and ${swim()}"
}

object TraitMixinDemo {
  def main(args: Array[String]): Unit = {
    val duck = new Duck()
    println(duck.describe())
  }
}
