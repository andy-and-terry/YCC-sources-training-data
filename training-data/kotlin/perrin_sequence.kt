// Perrin sequence P(n)=P(n-2)+P(n-3)
fun main() {
    val v = mutableListOf(3, 0, 2)
    for (i in 3 until 10) v.add(v[i - 2] + v[i - 3])
    println(v.joinToString(" "))
}
