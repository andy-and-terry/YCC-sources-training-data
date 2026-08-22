import java.util.PriorityQueue

fun main() {
    val pq = PriorityQueue<Int>()
    listOf(5, 3, 8, 1, 9, 2).forEach { pq.add(it) }
    val sorted = mutableListOf<Int>()
    while (pq.isNotEmpty()) sorted.add(pq.poll())
    println(sorted)

    data class Task(val name: String, val priority: Int)
    val taskQueue = PriorityQueue<Task>(compareBy { it.priority })
    taskQueue.add(Task("low", 3))
    taskQueue.add(Task("high", 1))
    taskQueue.add(Task("medium", 2))
    while (taskQueue.isNotEmpty()) println(taskQueue.poll())
}
