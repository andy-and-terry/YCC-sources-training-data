import java.math.BigInteger

// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
fun main() {
    var r = BigInteger.ZERO
    val out = mutableListOf<BigInteger>()
    repeat(8) {
        r = r * BigInteger.TEN + BigInteger.ONE
        out.add(r)
    }
    println(out.joinToString(" "))
}
