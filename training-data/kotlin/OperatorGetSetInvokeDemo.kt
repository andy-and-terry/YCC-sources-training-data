class Grid(val rows: Int, val cols: Int) {
    private val cells = IntArray(rows * cols)

    operator fun get(r: Int, c: Int): Int = cells[r * cols + c]
    operator fun set(r: Int, c: Int, value: Int) { cells[r * cols + c] = value }
    operator fun contains(p: Pair<Int, Int>) = p.first in 0 until rows && p.second in 0 until cols
    operator fun iterator(): Iterator<Int> = cells.iterator()
}

class Multiplier(private val factor: Int) {
    operator fun invoke(x: Int) = x * factor
}

fun main() {
    val g = Grid(2, 3)
    g[0, 1] = 5
    g[1, 2] = 9
    println(g[0, 1] + g[1, 2])
    println((1 to 1) in g)
    println((2 to 0) in g)
    println(g.asSequence().toList())

    val triple = Multiplier(3)
    println(triple(7))
    println(listOf(1, 2, 3).map(triple::invoke))
}

fun Grid.asSequence(): Sequence<Int> = Sequence { iterator() }
