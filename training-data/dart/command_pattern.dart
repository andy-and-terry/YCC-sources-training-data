abstract class Command {
  void execute();
  void undo();
}

class TextDocument {
  String content = '';
}

class AppendTextCommand implements Command {
  final TextDocument document;
  final String text;

  AppendTextCommand(this.document, this.text);

  @override
  void execute() => document.content += text;

  @override
  void undo() {
    document.content = document.content.substring(
      0,
      document.content.length - text.length,
    );
  }
}

class CommandHistory {
  final List<Command> _history = [];

  void run(Command command) {
    command.execute();
    _history.add(command);
  }

  void undoLast() {
    if (_history.isEmpty) return;
    final command = _history.removeLast();
    command.undo();
  }
}

void main() {
  final document = TextDocument();
  final history = CommandHistory();

  history.run(AppendTextCommand(document, 'Hello, '));
  history.run(AppendTextCommand(document, 'world!'));
  print(document.content);

  history.undoLast();
  print(document.content);
}
