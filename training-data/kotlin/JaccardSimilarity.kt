fun <T> jaccard(a: Set<T>, b: Set<T>): Double {
    val union = a union b
    return if (union.isEmpty()) 1.0 else (a intersect b).size.toDouble() / union.size
}

fun main() {
    println(jaccard(setOf(1, 2, 3, 4), setOf(3, 4, 5)))
}
