class InsufficientFunds(val needed: Int) : Exception("need $needed more")

fun parseOrNull(s: String): Int? = try {
    s.toInt()
} catch (e: NumberFormatException) {
    null
}

fun withdraw(balance: Int, amount: Int): Int {
    require(amount > 0) { "amount must be positive" }
    if (amount > balance) throw InsufficientFunds(amount - balance)
    return balance - amount
}

fun main() {
    println(parseOrNull("42"))
    println(parseOrNull("x"))
    println(runCatching { withdraw(10, 50) }.exceptionOrNull()?.message)
    println(runCatching { withdraw(100, 30) }.getOrDefault(-1))
    try {
        withdraw(10, -1)
    } catch (e: IllegalArgumentException) {
        println("bad arg: ${e.message}")
    } finally {
        println("done")
    }
    val v: Int = parseOrNull("7") ?: error("unreachable")
    println(v)
}
