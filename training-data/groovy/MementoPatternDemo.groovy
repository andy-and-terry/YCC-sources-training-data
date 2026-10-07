class Memento {
    final String state

    Memento(String state) {
        this.state = state
    }
}

class TextEditor {
    String content = ""

    void type(String text) {
        content += text
    }

    Memento save() {
        return new Memento(content)
    }

    void restore(Memento memento) {
        content = memento.state
    }
}

class History {
    List<Memento> snapshots = []

    void push(Memento memento) {
        snapshots.push(memento)
    }

    Memento pop() {
        return snapshots.pop()
    }
}

def editor = new TextEditor()
def history = new History()

editor.type("Hello")
history.push(editor.save())
editor.type(", world")
history.push(editor.save())
editor.type("!!!")

println editor.content
editor.restore(history.pop())
println editor.content
editor.restore(history.pop())
println editor.content
