// Thue-Morse: t(n) is the parity of the number of 1 bits in n
fun main() {
    println((0 until 32).joinToString("") { (Integer.bitCount(it) % 2).toString() })
}
