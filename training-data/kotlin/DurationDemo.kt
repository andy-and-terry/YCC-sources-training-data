import kotlin.time.Duration
import kotlin.time.Duration.Companion.hours
import kotlin.time.Duration.Companion.milliseconds
import kotlin.time.Duration.Companion.minutes
import kotlin.time.Duration.Companion.seconds
import kotlin.time.DurationUnit

fun describe(d: Duration): String =
    d.toComponents { hours, minutes, seconds, _ ->
        "%dh %02dm %02ds".format(hours, minutes, seconds)
    }

fun main() {
    val a = 90.minutes
    val b = 45.seconds
    val c = 1500.milliseconds

    println(a)
    println(b)
    println(c)
    println(a + b)
    println(a - 1.hours)
    println(b * 2)
    println(a / 3)
    println(a > b)

    println(a.inWholeHours)
    println(a.inWholeSeconds)
    println(c.toDouble(DurationUnit.SECONDS))
    println(describe(2.hours + 5.minutes + 9.seconds))

    println(Duration.parse("PT1H30M"))
    println(Duration.parse("2h 15m"))
    println(Duration.ZERO.isPositive())
    println(listOf(3.minutes, 20.seconds, 1.hours).sorted())
    println(listOf(3.minutes, 20.seconds, 1.hours).fold(Duration.ZERO) { acc, d -> acc + d })
}
