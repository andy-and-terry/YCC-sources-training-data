interface Command {
    fun execute()
    fun undo()
}

class TextDocument {
    private val builder = StringBuilder()
    val text: String
        get() = builder.toString()

    fun append(text: String) {
        builder.append(text)
    }

    fun deleteLast(count: Int) {
        val end = builder.length
        builder.delete((end - count).coerceAtLeast(0), end)
    }
}

class AppendCommand(private val document: TextDocument, private val text: String) : Command {
    override fun execute() = document.append(text)
    override fun undo() = document.deleteLast(text.length)
}

class CommandHistory {
    private val history = ArrayDeque<Command>()

    fun run(command: Command) {
        command.execute()
        history.addLast(command)
    }

    fun undoLast() {
        history.removeLastOrNull()?.undo()
    }
}

fun main() {
    val document = TextDocument()
    val history = CommandHistory()

    history.run(AppendCommand(document, "Hello, "))
    history.run(AppendCommand(document, "world!"))
    println(document.text)

    history.undoLast()
    println(document.text)
}
