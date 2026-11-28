fun addBinary(a: String, b: String): String {
    val sb = StringBuilder()
    var i = a.lastIndex
    var j = b.lastIndex
    var carry = 0
    while (i >= 0 || j >= 0 || carry > 0) {
        var sum = carry
        if (i >= 0) sum += a[i--] - '0'
        if (j >= 0) sum += b[j--] - '0'
        sb.append(sum % 2)
        carry = sum / 2
    }
    return sb.reverse().toString()
}

fun main() {
    println(addBinary("1010", "1011")) // 10101
}
