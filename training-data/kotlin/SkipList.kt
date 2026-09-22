import kotlin.random.Random

class SkipList(private val maxLevel: Int = 16, private val p: Double = 0.5) {
    private class Node(val value: Int, level: Int) {
        val forward = arrayOfNulls<Node>(level + 1)
    }

    private val head = Node(Int.MIN_VALUE, maxLevel)
    private var level = 0

    private fun randomLevel(): Int {
        var lvl = 0
        while (lvl < maxLevel && Random.nextDouble() < p) lvl++
        return lvl
    }

    fun insert(value: Int) {
        val update = arrayOfNulls<Node>(maxLevel + 1)
        var current = head
        for (i in level downTo 0) {
            while (current.forward[i] != null && current.forward[i]!!.value < value) {
                current = current.forward[i]!!
            }
            update[i] = current
        }

        val newLevel = randomLevel()
        if (newLevel > level) {
            for (i in level + 1..newLevel) update[i] = head
            level = newLevel
        }

        val newNode = Node(value, newLevel)
        for (i in 0..newLevel) {
            newNode.forward[i] = update[i]!!.forward[i]
            update[i]!!.forward[i] = newNode
        }
    }

    fun contains(value: Int): Boolean {
        var current = head
        for (i in level downTo 0) {
            while (current.forward[i] != null && current.forward[i]!!.value < value) {
                current = current.forward[i]!!
            }
        }
        val candidate = current.forward[0]
        return candidate != null && candidate.value == value
    }
}

fun main() {
    val list = SkipList()
    for (v in listOf(3, 6, 7, 9, 12, 19, 17, 26, 21, 25)) list.insert(v)
    println(list.contains(19))
    println(list.contains(15))
    println(list.contains(25))
}
