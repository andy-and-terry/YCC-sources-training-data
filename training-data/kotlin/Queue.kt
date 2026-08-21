class Queue<T> {
    private val items = ArrayDeque<T>()

    fun enqueue(item: T) = items.addLast(item)

    fun dequeue(): T? = items.removeFirstOrNull()

    fun isEmpty(): Boolean = items.isEmpty()
}

fun main() {
    val queue = Queue<Int>()
    queue.enqueue(1)
    queue.enqueue(2)
    queue.enqueue(3)
    println("${queue.dequeue()} ${queue.isEmpty()}")
}
