fun <T : Comparable<T>> maxOfList(items: List<T>): T {
    var best = items.first()
    for (x in items) if (x > best) best = x
    return best
}

fun <T> copyWhenGreater(list: List<T>, threshold: T): List<T> where T : Comparable<T>, T : Number =
    list.filter { it > threshold }

class Box<out T>(val value: T)

class Sink<in T> {
    private val items = mutableListOf<T>()
    fun put(x: T) { items.add(x) }
    fun count() = items.size
}

fun main() {
    println(maxOfList(listOf(3, 8, 2)))
    println(maxOfList(listOf("kiwi", "apple")))
    println(copyWhenGreater(listOf(1, 5, 10), 4))

    val strBox: Box<String> = Box("hi")
    val anyBox: Box<Any> = strBox
    println(anyBox.value)

    val anySink: Sink<Any> = Sink()
    val strSink: Sink<String> = anySink
    strSink.put("x")
    println(anySink.count())
}
