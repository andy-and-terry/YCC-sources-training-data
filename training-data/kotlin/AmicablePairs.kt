// Amicable pairs below 1500 via sums of proper divisors.
fun s(n: Int): Int = (1 until n).filter { n % it == 0 }.sum()

fun main() {
    for (a in 2 until 1500) {
        val b = s(a)
        if (b > a && s(b) == a) println("$a $b")
    }
}
