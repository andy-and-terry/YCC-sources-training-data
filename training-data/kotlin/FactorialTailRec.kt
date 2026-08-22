tailrec fun factorial(n: Long, acc: Long = 1): Long =
    if (n <= 1) acc else factorial(n - 1, n * acc)

fun main() {
    for (i in 0..10) {
        println(factorial(i.toLong()))
    }
}
