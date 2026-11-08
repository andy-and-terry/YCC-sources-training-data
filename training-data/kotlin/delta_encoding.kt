fun encode(xs: List<Int>) = listOf(xs.first()) + xs.zipWithNext { a, b -> b - a }
fun decode(ds: List<Int>) = ds.runningReduce { acc, d -> acc + d }

fun main() {
    val d = encode(listOf(10, 12, 15, 15, 20))
    println(d)
    println(decode(d))
}
