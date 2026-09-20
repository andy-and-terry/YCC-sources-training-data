@JvmInline
value class Meters(val value: Double) {
    operator fun plus(other: Meters) = Meters(value + other.value)
    fun toFeet(): Double = value * 3.28084
}

@JvmInline
value class UserId(val id: String)

fun greet(userId: UserId) = "Hello, user ${userId.id}"

fun main() {
    val a = Meters(5.0)
    val b = Meters(2.5)
    val total = a + b
    println("${total.value}m = ${total.toFeet()}ft")

    val userId = UserId("u-42")
    println(greet(userId))
}
