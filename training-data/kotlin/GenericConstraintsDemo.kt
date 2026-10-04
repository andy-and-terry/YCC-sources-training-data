fun <T : Comparable<T>> maxOf3(a: T, b: T, c: T): T = maxOf(a, maxOf(b, c))

fun <T> List<T>.secondOrNull(): T? = if (size >= 2) this[1] else null

fun <T> copyWhenGreater(src: List<T>, dst: MutableList<T>, threshold: T) where T : Comparable<T>, T : Number {
    for (x in src) if (x > threshold) dst.add(x)
}

interface Animal { val name: String }
class Dog(override val name: String) : Animal
class Cat(override val name: String) : Animal

fun <T : Animal> loudest(animals: List<T>): T = animals.maxByOrNull { it.name.length }!!

class Box<out T>(val value: T)

class Sink<in T> {
    fun accept(item: T) = println("got $item")
}

fun addAll(from: List<out Number>, to: MutableList<in Number>) {
    for (n in from) to.add(n)
}

inline fun <reified T> filterByType(items: List<Any>): List<T> = items.filterIsInstance<T>()

fun main() {
    println(maxOf3(3, 9, 4))
    println(maxOf3("pear", "apple", "zebra"))
    println(listOf(1).secondOrNull() to listOf(1, 2).secondOrNull())

    val dst = mutableListOf<Int>()
    copyWhenGreater(listOf(1, 5, 10, 3), dst, 4)
    println(dst)

    println(loudest(listOf(Dog("Rex"), Dog("Maximus"))).name)

    val boxOfDog: Box<Animal> = Box(Dog("Fido"))
    println(boxOfDog.value.name)

    val sink: Sink<Dog> = Sink<Animal>()
    sink.accept(Dog("Rover"))

    val out = mutableListOf<Number>()
    addAll(listOf(1, 2), out)
    addAll(listOf(2.5), out)
    println(out)
    println(filterByType<String>(listOf(1, "a", 2.0, "b")))
}
