class MinStack {
    private val values = mutableListOf<Int>()
    private val minValues = mutableListOf<Int>()

    fun push(value: Int) {
        values.add(value)
        val currentMin = if (minValues.isEmpty()) value else minOf(value, minValues.last())
        minValues.add(currentMin)
    }

    fun pop() {
        if (values.isNotEmpty()) {
            values.removeAt(values.size - 1)
            minValues.removeAt(minValues.size - 1)
        }
    }

    fun top(): Int? = values.lastOrNull()

    fun getMin(): Int? = minValues.lastOrNull()
}

fun main() {
    val stack = MinStack()
    stack.push(5)
    stack.push(2)
    stack.push(8)
    println(stack.getMin())
    stack.pop()
    println(stack.getMin())
    println(stack.top())
}
