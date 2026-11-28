import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*

fun main() = runBlocking {
    flow { for (i in 1..5) { delay(10); emit(i) } }
        .filter { it % 2 == 1 }
        .map { it * it }
        .collect { println(it) }
}
