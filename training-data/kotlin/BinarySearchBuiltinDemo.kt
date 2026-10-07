data class Version(val major: Int, val minor: Int) : Comparable<Version> {
    override fun compareTo(other: Version): Int =
        compareValuesBy(this, other, Version::major, Version::minor)

    override fun toString() = "$major.$minor"
}

fun main() {
    val sorted = listOf(1, 3, 5, 7, 9, 11)
    println(sorted.binarySearch(7))
    println(sorted.binarySearch(4))
    val insertion = -sorted.binarySearch(4) - 1
    println("insert 4 at $insertion")

    println(sorted.binarySearch(5, fromIndex = 1, toIndex = 4))

    val words = listOf("apple", "banana", "cherry", "date")
    println(words.binarySearch("cherry"))

    val versions = listOf(Version(1, 0), Version(1, 5), Version(2, 0), Version(3, 1))
    println(versions.binarySearch(Version(2, 0)))
    println(versions.binarySearch(Version(2, 5)))

    val byKey = versions.binarySearchBy(3) { it.major }
    println(byKey)

    val arr = intArrayOf(10, 20, 30, 40)
    println(arr.binarySearch(30))
    println(arr.toList().binarySearch(25).let { if (it < 0) "missing" else "found" })
    println(versions.sortedDescending().first())
}
