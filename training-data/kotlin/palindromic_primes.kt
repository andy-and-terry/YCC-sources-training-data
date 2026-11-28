fun isPrime(n: Int): Boolean = n >= 2 && (2..Math.sqrt(n.toDouble()).toInt()).none { n % it == 0 }

fun isPalindrome(n: Int): Boolean = n.toString().let { it == it.reversed() }

fun main() {
    println((2 until 200).filter { isPalindrome(it) && isPrime(it) })
    // [2, 3, 5, 7, 11, 101, 131, 151, 181, 191]
}
