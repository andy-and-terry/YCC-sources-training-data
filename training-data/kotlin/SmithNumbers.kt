fun digitSum(n: Int): Int = n.toString().sumOf { it - '0' }

fun isSmith(n: Int): Boolean {
    var m = n
    var sum = 0
    var p = 2
    while (p * p <= m) {
        while (m % p == 0) {
            sum += digitSum(p)
            m /= p
        }
        p++
    }
    if (m == n) return false // prime
    if (m > 1) sum += digitSum(m)
    return sum == digitSum(n)
}

fun main() {
    println((2 until 100).filter { isSmith(it) }.joinToString(" "))
}
