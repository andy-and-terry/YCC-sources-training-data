fun sigma(n: Int) = (1..n).filter { n % it == 0 }.sum()

fun main() {
    println((1..20).filter { sigma(it) < 2 * it })
}
