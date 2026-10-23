inline fun runTwice(noinline first: () -> Unit, second: () -> Unit) {
    val saved: () -> Unit = first
    saved()
    second()
}

inline fun runLater(crossinline action: () -> Unit): Runnable {
    return Runnable { action() }
}

fun findFirstNegative(values: List<Int>): Int? {
    values.forEach {
        if (it < 0) return it
    }
    return null
}

fun main() {
    runTwice({ println("first") }, { println("second") })

    val r = runLater { println("deferred action") }
    println("before run")
    r.run()

    println(findFirstNegative(listOf(3, 5, -2, 7)))
    println(findFirstNegative(listOf(1, 2)))
}
