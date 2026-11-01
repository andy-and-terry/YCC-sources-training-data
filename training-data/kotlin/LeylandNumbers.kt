import java.math.BigInteger

// Leyland numbers: x^y + y^x for x >= y >= 2.
fun leyland(x: Int, y: Int): BigInteger =
    BigInteger.valueOf(x.toLong()).pow(y) + BigInteger.valueOf(y.toLong()).pow(x)

fun main() {
    val vals = (2..4).flatMap { x -> (2..x).map { y -> leyland(x, y) } }
    println(vals.joinToString(" "))
}
