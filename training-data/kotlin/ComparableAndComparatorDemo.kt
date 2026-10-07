data class Version(val major: Int, val minor: Int, val patch: Int) : Comparable<Version> {
    override fun compareTo(other: Version): Int =
        compareValuesBy(this, other, Version::major, Version::minor, Version::patch)

    override fun toString() = "$major.$minor.$patch"

    companion object {
        fun parse(s: String): Version {
            val (a, b, c) = s.split(".").map { it.toInt() }
            return Version(a, b, c)
        }
    }
}

fun main() {
    val versions = listOf("1.10.0", "1.2.9", "2.0.0", "1.2.10").map(Version::parse)
    println(versions.sorted())
    println(versions.max())
    println(Version(1, 0, 0) < Version(1, 0, 1))
    println(versions.sortedDescending().first())
    println(versions.sortedWith(compareBy<Version> { it.minor }.thenByDescending { it.patch }))
}
