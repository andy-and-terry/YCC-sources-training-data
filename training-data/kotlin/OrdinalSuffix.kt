fun ordinal(n: Int): String {
    val suffix = when {
        n % 100 in 11..13 -> "th"
        n % 10 == 1 -> "st"
        n % 10 == 2 -> "nd"
        n % 10 == 3 -> "rd"
        else -> "th"
    }
    return "$n$suffix"
}

fun main() = println(listOf(1, 2, 3, 4, 11, 12, 13, 21, 101, 111).joinToString(" ", transform = ::ordinal))
