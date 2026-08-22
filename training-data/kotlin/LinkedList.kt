class ListNode(val value: Int) {
    var next: ListNode? = null
}

class SinglyLinkedList {
    private var head: ListNode? = null

    fun push(value: Int) {
        val node = ListNode(value)
        if (head == null) {
            head = node
            return
        }
        var cur = head
        while (cur?.next != null) {
            cur = cur.next
        }
        cur?.next = node
    }

    fun reversedList(): List<Int> {
        var prev: ListNode? = null
        var cur = head
        while (cur != null) {
            val next = cur.next
            cur.next = prev
            prev = cur
            cur = next
        }
        head = prev
        val result = mutableListOf<Int>()
        var node = head
        while (node != null) {
            result.add(node.value)
            node = node.next
        }
        return result
    }
}

fun main() {
    val list = SinglyLinkedList()
    listOf(1, 2, 3, 4).forEach { list.push(it) }
    println(list.reversedList())
}
