sealed interface Json
data class JNum(val value: Double) : Json
data class JStr(val value: String) : Json
data class JArr(val items: List<Json>) : Json

fun describe(x: Any?): String = when (x) {
    null -> "null"
    is Int -> "int ${x + 1}"
    is String -> "string of length ${x.length}"
    is List<*> -> "list of ${x.size}"
    is Map<*, *> -> "map with keys ${x.keys}"
    else -> "other ${x::class.simpleName}"
}

fun render(j: Json): String = when (j) {
    is JNum -> j.value.toString()
    is JStr -> "\"${j.value}\""
    is JArr -> j.items.joinToString(",", "[", "]") { render(it) }
}

fun lengthOrZero(x: Any): Int {
    if (x !is String) return 0
    return x.length
}

fun main() {
    listOf(null, 41, "kotlin", listOf(1, 2), mapOf("k" to 1), 2.5).forEach { println(describe(it)) }

    val any: Any = "text"
    val asInt = any as? Int
    println(asInt)
    val asStr = any as? String
    println(asStr?.uppercase())

    println(lengthOrZero("hello") + lengthOrZero(5))
    println(render(JArr(listOf(JNum(1.0), JStr("a"), JArr(emptyList())))))

    val value: Any = 7
    if (value is Int && value > 5) println("big int")
    try {
        val bad = any as Int
        println(bad)
    } catch (e: ClassCastException) {
        println("cast failed")
    }
}
