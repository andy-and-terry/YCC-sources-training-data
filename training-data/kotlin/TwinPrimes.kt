fun main() {
    val n = 50
    val composite = BooleanArray(n + 1)
    var i = 2
    while (i * i <= n) {
        if (!composite[i]) for (j in i * i..n step i) composite[j] = true
        i++
    }
    val twins = (3..n - 2).filter { !composite[it] && !composite[it + 2] }.map { it to it + 2 }
    println(twins)
}
