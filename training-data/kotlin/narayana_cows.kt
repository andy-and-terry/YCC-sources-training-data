// Narayana's cows N(n)=N(n-1)+N(n-3)
fun main() {
    val v = mutableListOf(1, 1, 1)
    for (i in 3 until 10) v.add(v[i - 1] + v[i - 3])
    println(v.joinToString(" "))
}
