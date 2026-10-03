object VarianceDemo {
  class Animal(val name: String)
  class Dog(name: String) extends Animal(name)
  class Cat(name: String) extends Animal(name)

  // Covariant: a Container[Dog] IS-A Container[Animal], since only Animals
  // are ever produced (read), never consumed.
  class Container[+A](private val item: A) {
    def get: A = item
  }

  // Contravariant: a Feeder[Animal] can act as a Feeder[Dog], since it can
  // feed any Animal, Dog included -- consumers work backwards on the hierarchy.
  trait Feeder[-A] {
    def feed(animal: A): String
  }

  class AnimalFeeder extends Feeder[Animal] {
    def feed(animal: Animal): String = s"feeding ${animal.name} generic food"
  }

  def describe(container: Container[Animal]): String = s"container holds ${container.get.name}"
  def feedDog(feeder: Feeder[Dog], dog: Dog): String = feeder.feed(dog)

  def main(args: Array[String]): Unit = {
    val dogContainer: Container[Dog] = new Container(new Dog("Rex"))
    println(describe(dogContainer)) // covariance lets this compile

    val feeder: Feeder[Animal] = new AnimalFeeder
    println(feedDog(feeder, new Dog("Rex"))) // contravariance lets this compile
  }
}
