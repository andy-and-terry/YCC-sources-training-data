fun binaryGap(n: Int): Int =
    Integer.toBinaryString(n).trimEnd('0').split('1').maxOfOrNull { it.length } ?: 0

fun main() {
    listOf(9, 529, 20, 15, 1041).forEach { println("$it ${Integer.toBinaryString(it)} ${binaryGap(it)}") }
}
