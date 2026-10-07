data class Version(val major: Int, val minor: Int) : Comparable<Version> {
    override fun compareTo(other: Version) =
        compareValuesBy(this, other, { it.major }, { it.minor })

    companion object {
        fun parse(s: String): Version {
            val (a, b) = s.split(".").map { it.toInt() }
            return Version(a, b)
        }
    }
}

fun main() {
    val vs = listOf("1.10", "1.2", "2.0", "0.9").map(Version::parse)
    println(vs.sorted())
    println(vs.max())
    println(Version(1, 2) < Version(1, 10))
    println(vs.sortedByDescending { it.minor }.first())
    println(vs.minWithOrNull(compareBy<Version> { it.minor }.thenBy { it.major }))
}
