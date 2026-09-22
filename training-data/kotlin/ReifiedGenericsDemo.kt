inline fun <reified T> List<Any?>.filterIsType(): List<T> =
    this.filterIsInstance<T>()

inline fun <reified T> describe(value: Any?): String =
    if (value is T) "value is a ${T::class.simpleName}" else "value is not a ${T::class.simpleName}"

fun main() {
    val mixed = listOf(1, "two", 3, "four", 5.0)
    val ints: List<Int> = mixed.filterIsType()
    val strings: List<String> = mixed.filterIsType()

    println(ints)
    println(strings)

    println(describe<String>("hello"))
    println(describe<String>(42))
}
