public class MementoPattern {
    public class TextMemento {
        public String state;

        public TextMemento(String state) {
            this.state = state;
        }
    }

    public class TextEditor {
        private String content = '';

        public void type(String text) {
            content += text;
        }

        public String getContent() {
            return content;
        }

        public TextMemento save() {
            return new TextMemento(content);
        }

        public void restore(TextMemento memento) {
            content = memento.state;
        }
    }

    public class History {
        private List<TextMemento> snapshots = new List<TextMemento>();

        public void push(TextMemento memento) {
            snapshots.add(memento);
        }

        public TextMemento pop() {
            return snapshots.remove(snapshots.size() - 1);
        }
    }

    public static void main() {
        TextEditor editor = new TextEditor();
        History history = new History();

        editor.type('Hello');
        history.push(editor.save());
        editor.type(', World');
        history.push(editor.save());
        editor.type('!!!');

        System.debug('Before undo: ' + editor.getContent());
        editor.restore(history.pop());
        System.debug('After undo: ' + editor.getContent());
    }
}
