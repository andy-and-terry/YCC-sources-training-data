// `data object` gives singletons a readable toString, equals and hashCode.

sealed interface Event {
    data object Started : Event
    data object Stopped : Event
    data class Progress(val percent: Int) : Event
}

object PlainSingleton

fun describe(e: Event): String = when (e) {
    Event.Started -> "begin"
    Event.Stopped -> "end"
    is Event.Progress -> "${e.percent}% done"
}

fun main() {
    val events = listOf(Event.Started, Event.Progress(40), Event.Progress(90), Event.Stopped)
    for (e in events) {
        println("$e -> ${describe(e)}")
    }

    // Plain objects print an identity hash; data objects print their name
    println(Event.Started)
    println(PlainSingleton.toString().startsWith("PlainSingleton@"))

    println(Event.Started == Event.Started)
    println(Event.Started.hashCode() == Event.Started.hashCode())
    println(Event.Started === Event.Stopped)
}
