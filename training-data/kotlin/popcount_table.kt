// Population count (number of set bits) for 0..15
fun main() {
    println((0..15).joinToString(" ") { Integer.bitCount(it).toString() })
}
