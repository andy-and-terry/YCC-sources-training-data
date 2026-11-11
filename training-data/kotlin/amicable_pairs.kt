// Amicable pairs: d(a) == b and d(b) == a with a != b.
fun d(n: Int): Int = (1 until n).filter { n % it == 0 }.sum()

fun main() {
    for (a in 2 until 1500) {
        val b = d(a)
        if (b > a && d(b) == a) println("($a, $b)")
    }
}
