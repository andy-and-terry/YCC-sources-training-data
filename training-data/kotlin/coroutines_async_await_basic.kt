import kotlinx.coroutines.*
fun main() = runBlocking {
    val a = async { delay(5); 20 }
    val b = async { delay(5); 22 }
    println(a.await() + b.await())
}
