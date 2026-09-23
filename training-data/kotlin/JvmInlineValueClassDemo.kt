@JvmInline
value class Meters(val value: Double) {
    operator fun plus(other: Meters): Meters = Meters(value + other.value)
    fun toFeet(): Double = value * 3.28084
}

@JvmInline
value class UserId(val raw: String)

fun greet(id: UserId): String = "hello, $id"

fun main() {
    val a = Meters(5.0)
    val b = Meters(2.5)
    val total = a + b
    println(total)
    println(total.toFeet())

    val id = UserId("u-123")
    println(greet(id))
}
