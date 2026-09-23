import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*

fun main() = runBlocking {
    val events = MutableSharedFlow<String>(replay = 1)
    events.emit("startup")

    val subscriberA = async { events.take(2).toList() }
    val subscriberB = async { events.take(2).toList() }

    delay(10)
    events.emit("update")

    println(subscriberA.await())
    println(subscriberB.await())
}
