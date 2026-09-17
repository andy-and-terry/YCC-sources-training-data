import java.util.ArrayDeque;
import java.util.Deque;

public class MementoPattern {
    record Memento(String state) {}

    static class TextEditor {
        private String content = "";

        void type(String text) {
            content += text;
        }

        Memento save() {
            return new Memento(content);
        }

        void restore(Memento memento) {
            content = memento.state();
        }

        String getContent() {
            return content;
        }
    }

    static class History {
        private final Deque<Memento> snapshots = new ArrayDeque<>();

        void push(Memento memento) {
            snapshots.push(memento);
        }

        Memento pop() {
            return snapshots.pop();
        }
    }

    public static void main(String[] args) {
        TextEditor editor = new TextEditor();
        History history = new History();

        editor.type("Hello");
        history.push(editor.save());
        editor.type(", world");
        history.push(editor.save());
        editor.type("!!!");

        System.out.println(editor.getContent());
        editor.restore(history.pop());
        System.out.println(editor.getContent());
        editor.restore(history.pop());
        System.out.println(editor.getContent());
    }
}
