fun isPrime(n: Int): Boolean = n >= 2 && (2..Math.sqrt(n.toDouble()).toInt()).none { n % it == 0 }

fun reverse(n: Int): Int = n.toString().reversed().toInt()

fun main() {
    val emirps = (2 until 200).filter { reverse(it) != it && isPrime(it) && isPrime(reverse(it)) }
    println(emirps) // [13, 17, 31, 37, 71, 73, 79, 97, 107, 113, 149, 157, 167, 179, 199]
}
