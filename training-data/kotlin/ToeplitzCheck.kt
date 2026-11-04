fun isToeplitz(m: List<List<Int>>): Boolean =
    (1 until m.size).all { i -> (1 until m[i].size).all { j -> m[i][j] == m[i - 1][j - 1] } }

fun main() {
    println(isToeplitz(listOf(listOf(1, 2, 3), listOf(4, 1, 2), listOf(5, 4, 1))))
    println(isToeplitz(listOf(listOf(1, 2), listOf(2, 2))))
}
