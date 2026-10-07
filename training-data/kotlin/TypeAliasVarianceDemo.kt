// A typealias gives a long generic signature a readable name.
typealias Validator<T> = (T) -> Boolean

fun <T> filterBy(items: List<T>, validator: Validator<T>): List<T> = items.filter(validator)

// `out` marks Producer as covariant: a Producer<Cat> can be used where a
// Producer<Animal> is expected, since it only ever produces T, never
// consumes it.
interface Producer<out T> {
    fun produce(): T
}

// `in` marks Consumer as contravariant: a Consumer<Animal> can be used
// where a Consumer<Cat> is expected, since it only ever consumes T.
interface Consumer<in T> {
    fun consume(item: T)
}

open class Animal(val name: String)
class Cat(name: String) : Animal(name)

class CatProducer : Producer<Cat> {
    override fun produce() = Cat("Whiskers")
}

class AnimalConsumer : Consumer<Animal> {
    override fun consume(item: Animal) = println("consuming ${item.name}")
}

fun main() {
    val isEven: Validator<Int> = { it % 2 == 0 }
    println(filterBy(listOf(1, 2, 3, 4, 5, 6), isEven))

    val catProducer: Producer<Animal> = CatProducer() // covariance in action
    println("produced: ${catProducer.produce().name}")

    val animalConsumer: Consumer<Cat> = AnimalConsumer() // contravariance in action
    animalConsumer.consume(Cat("Mittens"))
}
