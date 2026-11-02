import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*

fun main() = runBlocking {
    flowOf(1, 2, 3, 4).map { it * it }.filter { it > 3 }.collect { println(it) }
}
