fun interleave(vararg parts: String): String = buildString {
    val longest = parts.maxOfOrNull { it.length } ?: 0
    for (i in 0 until longest) for (p in parts) if (i < p.length) append(p[i])
}

fun main() {
    println(interleave("abc", "12345"))
    println(interleave("ab", "cd", "efg"))
}
