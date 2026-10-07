class EditorMemento : Object {
    public string content;

    public EditorMemento(string content) {
        this.content = content;
    }
}

class TextEditor : Object {
    public string content = "";

    public void type_text(string text) {
        content += text;
    }

    public EditorMemento save() {
        return new EditorMemento(content);
    }

    public void restore(EditorMemento memento) {
        content = memento.content;
    }
}

class History : Object {
    private Gee.ArrayList<EditorMemento> mementos = new Gee.ArrayList<EditorMemento>();

    public void push(EditorMemento memento) {
        mementos.add(memento);
    }

    public EditorMemento? pop() {
        if (mementos.size == 0) {
            return null;
        }
        var last = mementos[mementos.size - 1];
        mementos.remove_at(mementos.size - 1);
        return last;
    }
}

void main() {
    var editor = new TextEditor();
    var history = new History();

    editor.type_text("Hello");
    history.push(editor.save());

    editor.type_text(", world");
    history.push(editor.save());

    editor.type_text("!!! (typo)");
    stdout.printf("before undo: %s\n", editor.content);

    var last_saved = history.pop();
    if (last_saved != null) {
        editor.restore(last_saved);
    }

    stdout.printf("after undo: %s\n", editor.content);
}
