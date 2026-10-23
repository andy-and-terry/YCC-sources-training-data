fun hofstadterQ(count: Int): List<Int> {
    val q = IntArray(count + 1)
    q[1] = 1
    q[2] = 1
    for (n in 3..count) q[n] = q[n - q[n - 1]] + q[n - q[n - 2]]
    return q.drop(1)
}

fun main() {
    println(hofstadterQ(20).joinToString(" "))
}
