import kotlin.concurrent.thread

class InsufficientFunds(requested: Long, available: Long) :
    Exception("requested $requested, available $available")

class BankAccount {
    private val lock = Any()
    private var balance = 0L

    fun deposit(amount: Long) {
        require(amount > 0) { "amount must be positive" }
        synchronized(lock) { balance += amount }
    }

    fun withdraw(amount: Long) = synchronized(lock) {
        if (amount > balance) throw InsufficientFunds(amount, balance)
        balance -= amount
    }

    fun balance(): Long = synchronized(lock) { balance }
}

fun main() {
    val acct = BankAccount()
    (1..8).map { thread { repeat(1000) { acct.deposit(1) } } }.forEach { it.join() }
    println(acct.balance())
    try { acct.withdraw(1_000_000) } catch (e: InsufficientFunds) { println(e.message) }
}
