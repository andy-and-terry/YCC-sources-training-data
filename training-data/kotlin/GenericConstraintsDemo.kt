fun <T : Comparable<T>> maxOfList(items: List<T>): T? {
    var best: T? = null
    for (i in items) if (best == null || i > best) best = i
    return best
}

fun <T> T.printed(): T = also { println(it) }

fun <K, V : Comparable<V>> Map<K, V>.maxKey(): K? = maxByOrNull { it.value }?.key

class Box<out T>(val value: T)
class Sink<in T> { fun accept(t: T) = println("got $t") }

fun <T> where_(x: T): String where T : CharSequence, T : Comparable<T> = x.toString()

fun main() {
    println(maxOfList(listOf(3, 9, 4)))
    println(maxOfList(listOf("pear", "zoo")))
    "hello".printed()
    println(mapOf("a" to 3, "b" to 7).maxKey())
    val b: Box<Any> = Box("str")
    println(b.value)
    val s: Sink<String> = Sink<CharSequence>()
    s.accept("x")
    println(where_("w"))
}
