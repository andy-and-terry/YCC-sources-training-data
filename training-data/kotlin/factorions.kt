fun main() {
    val fact = intArrayOf(1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880)
    val result = (1 until 50000).filter { n -> n.toString().sumOf { fact[it - '0'] } == n }
    println(result) // [1, 2, 145, 40585]
}
