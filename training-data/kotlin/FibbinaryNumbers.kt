// Fibbinary numbers: no two adjacent 1 bits.
fun main() {
    println((0 until 50).filter { it and (it shr 1) == 0 }.joinToString(" "))
}
