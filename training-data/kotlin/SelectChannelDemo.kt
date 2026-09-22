import kotlinx.coroutines.*
import kotlinx.coroutines.channels.*
import kotlinx.coroutines.selects.select

fun CoroutineScope.tickingSource(label: String, delayMs: Long, count: Int): ReceiveChannel<String> = produce {
    repeat(count) { i ->
        delay(delayMs)
        send("$label-$i")
    }
}

fun main() = runBlocking {
    val fast = tickingSource("fast", 10, 3)
    val slow = tickingSource("slow", 25, 2)
    val received = mutableListOf<String>()

    repeat(5) {
        select<Unit> {
            fast.onReceive { received.add(it) }
            slow.onReceive { received.add(it) }
        }
    }

    println(received.sorted())
}
