class Stack<T> {
    private val items = mutableListOf<T>()

    fun push(item: T) = items.add(item)

    fun pop(): T? = if (items.isEmpty()) null else items.removeAt(items.size - 1)

    fun peek(): T? = items.lastOrNull()

    fun isEmpty(): Boolean = items.isEmpty()
}

fun main() {
    val intStack = Stack<Int>()
    intStack.push(1)
    intStack.push(2)
    intStack.push(3)
    println(intStack.pop())
    println(intStack.peek())

    val stringStack = Stack<String>()
    stringStack.push("a")
    stringStack.push("b")
    println(stringStack.pop())
}
