const val MAX_USERS = 100
private const val GREETING = "hello"

object Config {
    const val VERSION = "1.2.3"
    val startedAt = "now"
}

class Limits {
    companion object {
        const val MIN = 1
        const val MAX = 10
        fun clamp(n: Int) = n.coerceIn(MIN, MAX)
    }
}

fun main() {
    println(MAX_USERS)
    println(GREETING.uppercase())
    println(Config.VERSION)
    println(Limits.clamp(50))
    println(Limits.clamp(-5))
    println(Limits.MIN..Limits.MAX)
}
