// Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
fun jacobsthal(): Sequence<Long> =
    generateSequence(0L to 1L) { (a, b) -> b to b + 2 * a }.map { it.first }

fun main() {
    println(jacobsthal().take(15).joinToString(" "))
}
