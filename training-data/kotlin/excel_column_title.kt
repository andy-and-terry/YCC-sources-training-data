fun columnTitle(number: Int): String {
    var n = number
    val sb = StringBuilder()
    while (n > 0) {
        n--
        sb.append('A' + n % 26)
        n /= 26
    }
    return sb.reverse().toString()
}

fun main() {
    println("${columnTitle(28)} ${columnTitle(701)}") // AB ZY
}
