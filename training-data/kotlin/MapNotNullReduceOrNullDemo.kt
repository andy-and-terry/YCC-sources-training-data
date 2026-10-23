fun main() {
    val raw = listOf("10", "x", "25", "", "7", "3.5")

    // mapNotNull transforms and drops nulls in a single pass.
    val ints = raw.mapNotNull { it.toIntOrNull() }
    println(ints)

    val lengths = raw.mapNotNull { s -> s.takeIf { it.isNotEmpty() }?.length }
    println(lengths)

    val indexed = raw.mapIndexedNotNull { i, s -> if (s.toIntOrNull() != null) i else null }
    println(indexed)

    // reduceOrNull returns null instead of throwing on empty input.
    println(ints.reduceOrNull { a, b -> a + b })
    println(emptyList<Int>().reduceOrNull { a, b -> a + b })

    println(ints.maxOrNull())
    println(emptyList<Int>().minOrNull())
    println(ints.firstOrNull { it > 20 })
    println(ints.firstOrNull { it > 100 } ?: "none")

    // filterNotNull and requireNoNulls.
    val maybe = listOf(1, null, 3, null)
    println(maybe.filterNotNull())
    println(maybe.filterNotNull().requireNoNulls())

    // Safe combination of nullable values.
    val a: Int? = ints.getOrNull(0)
    val b: Int? = ints.getOrNull(10)
    println(listOfNotNull(a, b).sum())
}
