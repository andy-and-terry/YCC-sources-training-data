// Lattice paths with a rolling DP row.
fun lattice(n: Int): Long {
    val row = LongArray(n + 1) { 1L }
    repeat(n) { for (j in 1..n) row[j] += row[j - 1] }
    return row[n]
}

fun main() = println(lattice(3))
