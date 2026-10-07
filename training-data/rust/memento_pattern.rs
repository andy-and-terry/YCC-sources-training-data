// The memento pattern captures and restores an object's internal state
// without exposing that state's representation to the code that keeps
// the history.
#[derive(Clone)]
struct EditorMemento {
    content: String,
}

struct Editor {
    content: String,
}

impl Editor {
    fn new() -> Self {
        Editor { content: String::new() }
    }

    fn type_text(&mut self, text: &str) {
        self.content.push_str(text);
    }

    fn save(&self) -> EditorMemento {
        EditorMemento { content: self.content.clone() }
    }

    fn restore(&mut self, memento: &EditorMemento) {
        self.content = memento.content.clone();
    }
}

struct History {
    snapshots: Vec<EditorMemento>,
}

impl History {
    fn new() -> Self {
        History { snapshots: Vec::new() }
    }

    fn push(&mut self, memento: EditorMemento) {
        self.snapshots.push(memento);
    }

    fn pop(&mut self) -> Option<EditorMemento> {
        self.snapshots.pop()
    }
}

fn main() {
    let mut editor = Editor::new();
    let mut history = History::new();

    editor.type_text("Hello");
    history.push(editor.save());

    editor.type_text(", world");
    history.push(editor.save());

    editor.type_text("! (typo)");
    println!("before undo: {:?}", editor.content);

    if let Some(last_good) = history.pop() {
        editor.restore(&last_good);
    }
    println!("after undo: {:?}", editor.content);

    if let Some(earlier) = history.pop() {
        editor.restore(&earlier);
    }
    println!("after second undo: {:?}", editor.content);
}
