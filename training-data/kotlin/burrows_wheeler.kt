fun bwt(s: String): String =
    s.indices.map { s.substring(it) + s.substring(0, it) }.sorted().map { it.last() }.joinToString("")

fun main() = println(bwt("banana$"))
