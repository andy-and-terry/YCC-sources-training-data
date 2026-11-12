inline fun <reified T> describe(x: Any): String = if (x is T) "is ${T::class.simpleName}" else "not ${T::class.simpleName}"
fun main() {
    println(describe<String>("a"))
    println(describe<Int>("a"))
}
