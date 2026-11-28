fun minimumTotal(t: List<List<Int>>): Int {
    val dp = t.last().toIntArray()
    for (r in t.size - 2 downTo 0) {
        for (i in t[r].indices) dp[i] = t[r][i] + minOf(dp[i], dp[i + 1])
    }
    return dp[0]
}

fun main() {
    println(minimumTotal(listOf(listOf(2), listOf(3, 4), listOf(6, 5, 7), listOf(4, 1, 8, 3)))) // 11
}
