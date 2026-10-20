fun main() {
    val a = intArrayOf(5, 3, 8)
    a.sort(); println(a.joinToString())
    val m = Array(2) { r -> IntArray(3) { c -> r * 3 + c } }
    println(m.contentDeepToString())
    println((1..10 step 3).toList() + (10 downTo 1 step 4).toList() + ('a'..'e').toList())
    println((1 until 5).sum() to (1..0).isEmpty())
    for ((i, v) in a.withIndex()) print("$i:$v ")
    println()
    println(a.indices.reversed().map { a[it] })
    println(a.copyOfRange(1, 3).toList() + a.slice(0..1))
}
