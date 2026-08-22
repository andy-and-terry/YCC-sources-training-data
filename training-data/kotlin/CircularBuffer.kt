class CircularBuffer<T>(private val capacity: Int) {
    private val buffer = arrayOfNulls<Any?>(capacity)
    private var head = 0
    private var size = 0

    fun add(item: T) {
        val tail = (head + size) % capacity
        buffer[tail] = item
        if (size < capacity) size++ else head = (head + 1) % capacity
    }

    @Suppress("UNCHECKED_CAST")
    fun toList(): List<T> = (0 until size).map { buffer[(head + it) % capacity] as T }
}

fun main() {
    val cb = CircularBuffer<Int>(3)
    for (i in 1..5) cb.add(i)
    println(cb.toList())
}
