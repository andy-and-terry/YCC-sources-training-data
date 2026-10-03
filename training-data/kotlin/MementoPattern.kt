data class EditorMemento(val content: String)

class Editor(private var content: String = "") {
    fun type(text: String) {
        content += text
    }

    fun save() = EditorMemento(content)

    fun restore(memento: EditorMemento) {
        content = memento.content
    }

    fun show() = println("content: \"$content\"")
}

fun main() {
    val editor = Editor()
    editor.type("Hello")
    val checkpoint = editor.save()
    editor.type(", world!")
    editor.show()
    editor.restore(checkpoint)
    editor.show()
}
