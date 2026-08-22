import kotlinx.coroutines.*

suspend fun fetchValue(value: Int, delayMs: Long): Int {
    delay(delayMs)
    return value
}

fun main() = runBlocking {
    val a = async { fetchValue(1, 10) }
    val b = async { fetchValue(2, 5) }
    val c = async { fetchValue(3, 1) }
    println(listOf(a.await(), b.await(), c.await()))
}
