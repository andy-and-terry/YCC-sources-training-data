fun isPrime(n: Int) = n >= 2 && (2..Math.sqrt(n.toDouble()).toInt()).none { n % it == 0 }
fun rev(n: Int) = n.toString().reversed().toInt()

fun main() {
    val e = (2 until 100).filter { isPrime(it) && rev(it) != it && isPrime(rev(it)) }
    println(e)
}
