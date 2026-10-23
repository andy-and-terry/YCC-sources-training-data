import java.math.BigInteger

// Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
fun main() {
    var s = BigInteger.TWO
    for (i in 0 until 8) {
        println("s($i) = $s")
        s = s * s - s + BigInteger.ONE
    }
}
