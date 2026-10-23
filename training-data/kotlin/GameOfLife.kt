typealias Cell = Pair<Int, Int>

fun step(live: Set<Cell>): Set<Cell> {
    val counts = live
        .flatMap { (x, y) ->
            (-1..1).flatMap { dx -> (-1..1).map { dy -> Cell(x + dx, y + dy) } }.filter { it != Cell(x, y) }
        }
        .groupingBy { it }
        .eachCount()
    return counts.filter { (c, n) -> n == 3 || (n == 2 && c in live) }.keys
}

fun show(live: Set<Cell>) {
    for (y in 0..4) println((0..4).joinToString("") { x -> if (Cell(x, y) in live) "#" else "." })
    println()
}

fun main() {
    var cells: Set<Cell> = setOf(1 to 2, 2 to 2, 3 to 2)
    repeat(3) {
        show(cells)
        cells = step(cells)
    }
}
