fun describe(x: Int) = "Int($x)"
fun describe(x: Long) = "Long($x)"
fun describe(x: Double) = "Double($x)"
fun describe(x: String) = "String($x)"
fun describe(x: Any) = "Any($x)"
fun describe(x: Int, y: Int = 0) = "Int2($x,$y)"

fun main() {
    println(describe(1))
    println(describe(1L))
    println(describe(1.5))
    println(describe("s"))
    println(describe('c'))
    println(describe(listOf(1)))
    println(describe(1, 2))
    val any: Any = 5
    println(describe(any))
}
