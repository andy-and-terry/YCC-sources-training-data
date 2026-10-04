class BankAccount(initial: Int) {
    var balance: Int = initial
        private set
    private var closed = false

    init {
        require(initial >= 0) { "initial balance must be non-negative, got $initial" }
    }

    fun withdraw(amount: Int) {
        check(!closed) { "account is closed" }
        require(amount > 0) { "amount must be positive" }
        check(amount <= balance) { "insufficient funds: $balance < $amount" }
        balance -= amount
    }

    fun close() {
        closed = true
    }
}

fun firstWord(s: String?): String {
    val text = requireNotNull(s) { "input must not be null" }
    return text.trim().split(" ").first()
}

fun main() {
    val acct = BankAccount(100)
    acct.withdraw(30)
    println(acct.balance)

    val attempts = listOf<() -> Unit>(
        { acct.withdraw(-5) },
        { acct.withdraw(500) },
        { BankAccount(-1) },
        { firstWord(null) },
        { acct.close(); acct.withdraw(1) },
        { TODO("not implemented yet") },
        { error("explicit failure") },
        { val xs: List<Int> = emptyList(); xs.first() }
    )
    for (a in attempts) {
        try {
            a()
        } catch (e: Throwable) {
            println("${e::class.simpleName}: ${e.message}")
        }
    }
    println(firstWord("  hello world"))
}
