// Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
fun main() {
    var r = 0L
    for (n in 1..8) {
        r = r * 10 + 1
        println("$r" + if (r % 3 == 0L) "  (divisible by 3)" else "")
    }
}
