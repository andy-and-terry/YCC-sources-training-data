// Evil numbers have an even number of 1 bits.
fun main() {
    println((0..20).filter { Integer.bitCount(it) % 2 == 0 }.joinToString(" "))
}
