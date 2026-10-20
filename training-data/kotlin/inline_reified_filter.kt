inline fun <reified T> List<*>.onlyOfType(): List<T> = filterIsInstance<T>()

fun main() {
    val mixed = listOf(1, "a", 2.0, "b", 3)
    println(mixed.onlyOfType<String>())
    println(mixed.onlyOfType<Int>())
}
