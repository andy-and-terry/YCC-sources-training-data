@JvmInline
value class UserId(val raw: Int)

fun load(id: UserId) = "user ${id.raw}"

fun main() = println(load(UserId(7)))
