interface Command : Object {
    public abstract void execute();
    public abstract void undo();
}

class TextDocument : Object {
    public string text = "";
}

class InsertCommand : Object, Command {
    TextDocument doc;
    string inserted;

    public InsertCommand(TextDocument doc, string text) {
        this.doc = doc;
        this.inserted = text;
    }

    public void execute() {
        doc.text += inserted;
    }

    public void undo() {
        doc.text = doc.text.substring(0, doc.text.length - inserted.length);
    }
}

void main() {
    var doc = new TextDocument();
    var history = new Gee.ArrayList<Command>();

    Command insert1 = new InsertCommand(doc, "Hello, ");
    Command insert2 = new InsertCommand(doc, "world!");

    insert1.execute();
    history.add(insert1);
    insert2.execute();
    history.add(insert2);

    stdout.printf("%s\n", doc.text);

    Command last = history[history.size - 1];
    last.undo();
    history.remove_at(history.size - 1);
    stdout.printf("%s\n", doc.text);
}
