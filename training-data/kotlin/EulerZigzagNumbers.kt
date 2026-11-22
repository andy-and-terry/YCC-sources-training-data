// Euler zigzag numbers via the Seidel-Entringer boustrophedon.
fun main() {
    var row = listOf(1L)
    val out = mutableListOf(1L)
    repeat(9) {
        val next = mutableListOf(0L)
        for (x in row.reversed()) next.add(next.last() + x)
        row = next
        out.add(row.last())
    }
    println(out.joinToString(" "))
}
