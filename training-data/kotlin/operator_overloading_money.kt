data class Money(val cents: Long) {
    operator fun plus(o: Money) = Money(cents + o.cents)
    operator fun times(k: Int) = Money(cents * k)
    operator fun compareTo(o: Money) = cents.compareTo(o.cents)
    override fun toString() = "$${cents / 100}.${"%02d".format(cents % 100)}"
}
fun main() { println(Money(250) + Money(199) * 2); println(Money(5) < Money(6)) }
