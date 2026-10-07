struct EditorMemento {
    fileprivate let content: String
}

final class TextEditor {
    private(set) var content: String = ""

    func type(_ text: String) {
        content += text
    }

    func save() -> EditorMemento {
        EditorMemento(content: content)
    }

    func restore(_ memento: EditorMemento) {
        content = memento.content
    }
}

final class History {
    private var mementos: [EditorMemento] = []

    func push(_ memento: EditorMemento) {
        mementos.append(memento)
    }

    func pop() -> EditorMemento? {
        mementos.popLast()
    }
}

let editor = TextEditor()
let history = History()

editor.type("Hello")
history.push(editor.save())

editor.type(", world")
history.push(editor.save())

editor.type("!!! (typo)") // never saved, so undo can discard it in one step
print("before undo: \(editor.content)")

if let lastSaved = history.pop() {
    editor.restore(lastSaved)
}

print("after undo: \(editor.content)")
