fun hamming(a: String, b: String): Int {
    require(a.length == b.length) { "strands must be of equal length" }
    return a.zip(b).count { (x, y) -> x != y }
}

fun main() {
    println(hamming("GAGCCTACTAACGGGAT", "CATCGTAATGACGGCCT"))
    runCatching { hamming("AB", "A") }.onFailure { println("error: ${it.message}") }
}
