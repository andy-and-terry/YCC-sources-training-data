import kotlinx.coroutines.flow.*
import kotlinx.coroutines.runBlocking

fun numberFlow(): Flow<Int> = flow {
    for (i in 1..5) {
        emit(i)
    }
}

fun main() = runBlocking {
    val result = numberFlow()
        .filter { it % 2 == 0 }
        .map { it * it }
        .toList()
    println(result)
}
