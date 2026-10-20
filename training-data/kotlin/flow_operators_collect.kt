import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*

fun numbers() = flow { for (i in 1..5) { delay(5); emit(i) } }

fun main() = runBlocking {
    numbers().filter { it % 2 == 1 }.map { it * 10 }.collect { println(it) }
    println(numbers().reduce { a, b -> a + b })
    numbers().take(2).onEach { println("tap $it") }.toList()
    val shared = MutableSharedFlow<String>(replay = 1)
    shared.emit("hello")
    println(shared.first())
}
