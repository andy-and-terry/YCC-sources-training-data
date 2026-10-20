fun main() {
    val primes = generateSequence(2) { it + 1 }.filter { n -> (2..Math.sqrt(n.toDouble()).toInt()).none { n % it == 0 } }
    println(primes.take(10).toList())
    val fib = sequence {
        var a = 0; var b = 1
        while (true) { yield(a); a = b.also { b += a } }
    }
    println(fib.take(10).toList())
    println((1..Int.MAX_VALUE).asSequence().map { it * 2 }.filter { it % 3 == 0 }.first())
}
