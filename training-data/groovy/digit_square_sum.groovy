int digitSquareSum(int n) {
    Math.abs(n).toString().collect { (it as int) - ('0' as char) }.sum { it * it }
}
println digitSquareSum(123)
println digitSquareSum(-99)
