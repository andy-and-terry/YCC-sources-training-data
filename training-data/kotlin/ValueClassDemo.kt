@JvmInline
value class Email(val value: String) {
    init {
        require('@' in value && '.' in value.substringAfter('@')) { "invalid email: $value" }
    }

    val domain: String get() = value.substringAfter('@')
}

@JvmInline
value class UserId(val raw: Long)

data class User(val id: UserId, val email: Email)

fun main() {
    val u = User(UserId(42), Email("ada@example.com"))
    println("${u.id.raw} ${u.email.domain}")
    println(runCatching { Email("nope") }.exceptionOrNull()?.message)
}
