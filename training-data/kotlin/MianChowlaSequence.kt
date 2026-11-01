// Greedy sequence whose pairwise sums are all distinct.
fun main() {
    val seq = mutableListOf<Int>()
    val sums = mutableSetOf<Int>()
    var cand = 1
    while (seq.size < 8) {
        val fresh = mutableSetOf<Int>()
        val ok = (seq + cand).all { x ->
            val s = x + cand
            s !in sums && fresh.add(s)
        }
        if (ok) {
            seq += cand
            sums += fresh
        }
        cand++
    }
    println(seq.joinToString(" "))
}
