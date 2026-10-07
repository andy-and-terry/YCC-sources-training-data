fun sum(vararg numbers: Int): Int = numbers.sum()

fun <T> listOfNotNullItems(vararg items: T?): List<T> = items.filterNotNull()

fun format(prefix: String, vararg parts: String, separator: String = "/"): String =
    prefix + parts.joinToString(separator, prefix = "[", postfix = "]")

fun printAll(vararg items: Any?) {
    for ((i, item) in items.withIndex()) println("$i: $item")
}

fun main() {
    println(sum())
    println(sum(1, 2, 3))

    val arr = intArrayOf(4, 5, 6)
    println(sum(*arr))
    println(sum(1, *arr, 7))

    println(listOfNotNullItems("a", null, "b"))
    println(format("path", "usr", "local", "bin"))
    println(format("path", "a", "b", separator = "-"))

    val names = arrayOf("x", "y")
    println(format("p", *names, "z"))

    printAll(1, "two", null, 3.0)

    val copy = arr.copyOf()
    copy[0] = 99
    println(arr.toList() to copy.toList())
    println(listOf(*names, "w").size)
}
