inline fun <T, R> List<T>.myFold(init: R, op: (R, T) -> R): R {
    var acc = init
    for (x in this) acc = op(acc, x)
    return acc
}

fun main() {
    println(listOf(1, 2, 3, 4).myFold(0) { a, b -> a + b })
    println(listOf("a", "b").myFold("") { a, b -> a + b })
}
