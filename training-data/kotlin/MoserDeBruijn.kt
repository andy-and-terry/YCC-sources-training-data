// Read the binary digits of i as base-4 digits.
fun moserDeBruijn(i: Int): Long = if (i == 0) 0L else Integer.toBinaryString(i).toLong(4)

fun main() {
    println((0..9).joinToString(" ") { moserDeBruijn(it).toString() }) // 0 1 4 5 16 17 20 21 64 65
}
