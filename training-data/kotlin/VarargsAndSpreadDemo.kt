fun sum(vararg nums: Int): Int = nums.sum()

fun <T : Any> listOfNotNull2(vararg items: T?): List<T> = items.filterNotNull()

fun describe(prefix: String, vararg parts: String, separator: String = "-"): String =
    prefix + ":" + parts.joinToString(separator)

fun main() {
    println(sum())
    println(sum(1, 2, 3))

    val arr = intArrayOf(10, 20, 30)
    println(sum(*arr))
    println(sum(1, *arr, 100))

    println(listOfNotNull2("a", null, "b"))

    println(describe("p", "x", "y", "z"))
    println(describe("p", "x", "y", separator = "+"))

    val words = arrayOf("one", "two")
    println(describe("w", *words, "three"))

    val copy = arr.copyOf()
    copy[0] = 99
    println(arr.toList() to copy.toList())

    fun printAll(vararg values: Any?) = values.forEachIndexed { i, v -> println("$i=$v") }
    printAll(1, "two", null)
    println(listOf(*words, "extra").size)
    println(arrayOf(*words).contentToString())
}
