// Integer (1..3999) to Roman numeral using a greedy table.
val table = listOf(
    1000 to "M", 900 to "CM", 500 to "D", 400 to "CD", 100 to "C", 90 to "XC",
    50 to "L", 40 to "XL", 10 to "X", 9 to "IX", 5 to "V", 4 to "IV", 1 to "I",
)

fun toRoman(number: Int): String {
    var n = number
    val sb = StringBuilder()
    for ((value, symbol) in table) {
        while (n >= value) {
            sb.append(symbol)
            n -= value
        }
    }
    return sb.toString()
}

fun main() {
    println("${toRoman(1994)} ${toRoman(58)}")
}
