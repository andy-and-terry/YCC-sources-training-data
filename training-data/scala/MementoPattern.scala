case class Memento(state: String)

class TextEditor {
  private var content: String = ""

  def typeText(text: String): Unit = content += text
  def save(): Memento = Memento(content)
  def restore(memento: Memento): Unit = content = memento.state
  def getContent: String = content
}

object MementoPatternDemo {
  def main(args: Array[String]): Unit = {
    val editor = new TextEditor
    editor.typeText("Hello")
    val checkpoint = editor.save()
    editor.typeText(", world!")
    println(s"before undo: ${editor.getContent}")

    editor.restore(checkpoint)
    println(s"after undo: ${editor.getContent}")
  }
}
