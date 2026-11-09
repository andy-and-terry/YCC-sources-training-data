import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*

fun main() = runBlocking {
    flow { for (i in 1..3) emit(i) }
        .map { it * 10 }
        .collect { println(it) }
}
