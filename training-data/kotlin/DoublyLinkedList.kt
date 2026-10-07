class DoublyLinkedList<T> {
    private class Node<T>(val value: T) {
        var prev: Node<T>? = null
        var next: Node<T>? = null
    }

    private var head: Node<T>? = null
    private var tail: Node<T>? = null

    fun addLast(value: T) {
        val node = Node(value)
        if (tail == null) {
            head = node
            tail = node
        } else {
            node.prev = tail
            tail!!.next = node
            tail = node
        }
    }

    fun removeFirst(): T? {
        val node = head ?: return null
        head = node.next
        if (head != null) head!!.prev = null else tail = null
        return node.value
    }

    fun toList(): List<T> {
        val result = mutableListOf<T>()
        var current = head
        while (current != null) {
            result.add(current.value)
            current = current.next
        }
        return result
    }
}

fun main() {
    val list = DoublyLinkedList<Int>()
    list.addLast(1)
    list.addLast(2)
    list.addLast(3)
    println(list.toList())
    println(list.removeFirst())
    println(list.toList())
}
