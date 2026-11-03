fun digitSquareSum(n: Int): Int = Math.abs(n).toString().sumOf { (it - '0') * (it - '0') }

fun main() {
    println(digitSquareSum(123))
    println(digitSquareSum(-99))
}
