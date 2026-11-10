fun pieces(cuts: Int): Int = (cuts * cuts + cuts + 2) / 2

fun main() {
    println((0..9).joinToString(" ") { pieces(it).toString() }) // 1 2 4 7 11 16 22 29 37 46
}
