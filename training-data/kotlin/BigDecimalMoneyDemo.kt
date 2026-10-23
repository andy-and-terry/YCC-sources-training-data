import java.math.BigDecimal
import java.math.RoundingMode

// Binary floating point cannot represent 0.1 exactly; BigDecimal can.
data class LineItem(val name: String, val price: BigDecimal, val qty: Int) {
    val total: BigDecimal get() = price * qty.toBigDecimal()
}

fun main() {
    println(0.1 + 0.2)
    println(BigDecimal("0.1") + BigDecimal("0.2"))

    val items = listOf(
        LineItem("coffee", BigDecimal("3.45"), 3),
        LineItem("bagel", BigDecimal("2.10"), 2),
        LineItem("juice", BigDecimal("4.99"), 1),
    )
    val subtotal = items.fold(BigDecimal.ZERO) { acc, i -> acc + i.total }
    val tax = (subtotal * BigDecimal("0.0825")).setScale(2, RoundingMode.HALF_UP)
    val total = subtotal + tax

    items.forEach { println("%-8s %6s".format(it.name, it.total)) }
    println("subtotal: $subtotal")
    println("tax:      $tax")
    println("total:    $total")

    val share = total.divide(BigDecimal(3), 2, RoundingMode.HALF_EVEN)
    println("split 3 ways: $share")
    println(BigDecimal("2.50").compareTo(BigDecimal("2.5")))
    println(BigDecimal("2.50") == BigDecimal("2.5"))
    println(BigDecimal("2.50").stripTrailingZeros().toPlainString())
}
