fun farey(n: Int): List<String> {
    val terms = mutableListOf("0/1")
    var a = 0
    var b = 1
    var c = 1
    var d = n
    while (c <= n) {
        terms.add("$c/$d")
        val k = (n + b) / d
        val nc = k * c - a
        val nd = k * d - b
        a = c; b = d; c = nc; d = nd
    }
    return terms
}

fun main() {
    println(farey(5).joinToString(" "))
}
