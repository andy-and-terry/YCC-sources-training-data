// Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
fun padovan(count: Int): List<Long> {
    val p = mutableListOf<Long>()
    for (i in 0 until count) {
        p.add(if (i < 3) 1L else p[i - 2] + p[i - 3])
    }
    return p
}

fun main() {
    println(padovan(15).joinToString(" "))
}
