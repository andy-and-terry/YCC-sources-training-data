interface Producer<out T> {
    fun produce(): T
}

interface Consumer<in T> {
    fun consume(item: T)
}

open class Animal(val name: String)
class Dog(name: String) : Animal(name)

class DogProducer : Producer<Dog> {
    override fun produce() = Dog("Rex")
}

class AnimalPrinter : Consumer<Animal> {
    override fun consume(item: Animal) = println("consuming ${item.name}")
}

fun <T : Comparable<T>> largestOf(items: List<T>): T = items.reduce { a, b -> if (a >= b) a else b }

fun copy(from: List<Animal>, to: MutableList<in Animal>) {
    to.addAll(from)
}

fun main() {
    val animals: Producer<Animal> = DogProducer()
    println(animals.produce().name)

    val dogConsumer: Consumer<Dog> = AnimalPrinter()
    dogConsumer.consume(Dog("Fido"))

    println(largestOf(listOf(3, 8, 5)))
    println(largestOf(listOf("pear", "apple")))

    val sink = mutableListOf<Any>()
    copy(listOf(Animal("Cat")), sink)
    println(sink.size)

    val star: List<*> = listOf(1, "two", 3.0)
    println(star.size)
}
