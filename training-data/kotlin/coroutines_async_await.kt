import kotlinx.coroutines.*

fun main() = runBlocking {
    val a = async { delay(20); 10 }
    val b = async { delay(10); 32 }
    println(a.await() + b.await())
}
