// Moser-de Bruijn sequence: binary digits of n read in base 4.
fun main() {
    println((0 until 12).joinToString(" ") { Integer.toBinaryString(it).toInt(4).toString() })
}
