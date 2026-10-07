class Account(private var balance: Int) {
    init {
        require(balance >= 0) { "initial balance must be non-negative" }
    }

    fun withdraw(amount: Int): Int {
        require(amount > 0) { "amount must be positive" }
        check(balance >= amount) { "insufficient funds: $balance < $amount" }
        balance -= amount
        return balance
    }
}

fun describe(x: Any?): String {
    val s = requireNotNull(x) { "x must not be null" }
    return "got $s"
}

fun main() {
    val acct = Account(100)
    println(acct.withdraw(30))

    for (action in listOf({ acct.withdraw(-1) }, { acct.withdraw(500) }, { Account(-5) })) {
        try {
            action()
        } catch (e: IllegalArgumentException) {
            println("IAE: ${e.message}")
        } catch (e: IllegalStateException) {
            println("ISE: ${e.message}")
        }
    }

    println(describe(5))
    try {
        describe(null)
    } catch (e: IllegalArgumentException) {
        println(e.message)
    }

    val v: Int? = checkNotNull(3) { "never" }
    println(v)
    try {
        TODO("not yet")
    } catch (e: NotImplementedError) {
        println(e.message)
    }
}
