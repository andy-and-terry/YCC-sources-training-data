fun lisLength(a: List<Int>): Int {
    val tails = mutableListOf<Int>()
    for (x in a) {
        var i = tails.binarySearch(x)
        if (i < 0) i = -i - 1
        if (i == tails.size) tails.add(x) else tails[i] = x
    }
    return tails.size
}

fun main() = println(lisLength(listOf(10, 9, 2, 5, 3, 7, 101, 18)))
