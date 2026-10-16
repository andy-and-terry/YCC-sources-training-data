fun main() {
    val sb = StringBuilder()
    sb.append("Hello").append(',').append(' ').append(42)
    sb.insert(0, ">> ")
    sb.setCharAt(3, 'J')
    println(sb)
    println(sb.reverse())
    sb.clear()
    println(sb.isEmpty())

    val table = buildString {
        for (i in 1..3) {
            append(i).append(": ")
            repeat(i) { append('*') }
            appendLine()
        }
    }
    print(table)

    val csv = buildList {
        add("a")
        addAll(listOf("b", "c"))
    }.joinToString(",")
    println(csv)
}
