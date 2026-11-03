fun countPrimesBelow(n: Int): Int {
    if (n < 3) return 0
    val composite = BooleanArray(n)
    var count = 0
    for (i in 2 until n) {
        if (composite[i]) continue
        count++
        var j = i.toLong() * i
        while (j < n) { composite[j.toInt()] = true; j += i }
    }
    return count
}

fun main() = println(countPrimesBelow(100))
