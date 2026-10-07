case class Memento(content: String)

class Editor {
  private var content: String = ""

  def currentContent: String = content
  def typeText(text: String): Unit = content += text
  def save(): Memento = Memento(content)
  def restore(m: Memento): Unit = content = m.content
}

class History {
  private var mementos: List[Memento] = Nil

  def push(m: Memento): Unit = mementos = m :: mementos
  def pop(): Memento = {
    val m = mementos.head
    mementos = mementos.tail
    m
  }
}

object MementoPattern {
  def main(args: Array[String]): Unit = {
    val editor = new Editor
    val history = new History

    editor.typeText("Hello")
    history.push(editor.save())
    editor.typeText(", world")
    history.push(editor.save())
    editor.typeText("!!!")

    println(editor.currentContent)
    editor.restore(history.pop())
    println(editor.currentContent)
    editor.restore(history.pop())
    println(editor.currentContent)
  }
}
