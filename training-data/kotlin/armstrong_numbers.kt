import kotlin.math.pow

fun isArmstrong(n: Int): Boolean {
    val s = n.toString()
    return s.sumOf { (it - '0').toDouble().pow(s.length).toLong() } == n.toLong()
}

fun main() {
    println((1 until 1000).filter(::isArmstrong)) // [1..9, 153, 370, 371, 407]
}
