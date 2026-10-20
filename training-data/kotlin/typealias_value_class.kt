typealias Handler = (String) -> Unit
typealias Matrix = List<List<Int>>

@JvmInline
value class UserId(val raw: Int) { init { require(raw > 0) } }

fun register(h: Handler) = h("event")
fun trace(m: Matrix) = m.sumOf { it.sum() }

fun main() {
    register { println("got $it") }
    println(trace(listOf(listOf(1, 2), listOf(3))))
    println(UserId(5).raw)
    println(runCatching { UserId(0) }.isFailure)
}
