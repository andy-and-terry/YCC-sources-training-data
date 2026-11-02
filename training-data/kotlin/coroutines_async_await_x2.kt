import kotlinx.coroutines.*

fun main() = runBlocking {
    val a = async { delay(10); 20 }
    val b = async { delay(10); 22 }
    println(a.await() + b.await())
}
