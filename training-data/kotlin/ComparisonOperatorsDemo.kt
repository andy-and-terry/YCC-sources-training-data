data class Version(val major: Int, val minor: Int) : Comparable<Version> {
    override fun compareTo(other: Version): Int =
        compareValuesBy(this, other, Version::major, Version::minor)
}

fun main() {
    val v1 = Version(1, 9)
    val v2 = Version(2, 0)
    println(v1 < v2)
    println(v1 >= v2)
    println(maxOf(v1, v2))
    println(listOf(v2, v1, Version(1, 10)).sorted())
    println(v1.coerceIn(Version(1, 0), Version(1, 5)))
    println(Version(3, 0) in v1..v2)
    println(v2 in Version(1, 9)..Version(2, 5))
}
