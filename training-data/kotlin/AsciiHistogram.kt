fun histogram(s: String, width: Int = 30): String {
    val counts = s.groupingBy { it }.eachCount().toSortedMap()
    val peak = counts.values.max()
    return counts.entries.joinToString("\n") { (k, n) -> "$k | ${"#".repeat(maxOf(1, n * width / peak))} $n" }
}

fun main() = println(histogram("theraininspainfallsmainlyontheplain"))
