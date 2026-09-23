import kotlinx.coroutines.*
import kotlinx.coroutines.flow.*

class CounterViewModel {
    private val _count = MutableStateFlow(0)
    val count: StateFlow<Int> = _count

    fun increment() {
        _count.value += 1
    }
}

fun main() = runBlocking {
    val viewModel = CounterViewModel()
    val collected = mutableListOf<Int>()

    val job = launch {
        viewModel.count.collect { collected.add(it) }
    }

    repeat(3) {
        delay(10)
        viewModel.increment()
    }
    delay(10)
    job.cancel()

    println(collected)
}
