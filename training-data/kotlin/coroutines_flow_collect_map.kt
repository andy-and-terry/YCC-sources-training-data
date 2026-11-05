import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*

fun main() = runBlocking {
    flowOf(1, 2, 3, 4)
        .filter { it % 2 == 0 }
        .map { it * 10 }
        .collect { println(it) }
}
