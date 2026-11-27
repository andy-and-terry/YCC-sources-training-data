import kotlin.math.abs

fun secant(f: (Double) -> Double, a: Double, b: Double): Double {
    var x0 = a
    var x1 = b
    repeat(50) {
        val f0 = f(x0)
        val f1 = f(x1)
        if (f1 == f0) return x1
        val next = x1 - f1 * (x1 - x0) / (f1 - f0)
        x0 = x1
        x1 = next
        if (abs(x1 - x0) < 1e-12) return x1
    }
    return x1
}

fun main() = println(secant({ it * it - 2 }, 1.0, 2.0))
