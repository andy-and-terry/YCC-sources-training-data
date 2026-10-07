class EditorMemento {
  constructor(private readonly content: string) {}

  getContent(): string {
    return this.content;
  }
}

class Editor {
  private content = '';

  type(text: string): void {
    this.content += text;
  }

  save(): EditorMemento {
    return new EditorMemento(this.content);
  }

  restore(memento: EditorMemento): void {
    this.content = memento.getContent();
  }

  getContent(): string {
    return this.content;
  }
}

class EditHistory {
  private mementos: EditorMemento[] = [];

  push(memento: EditorMemento): void {
    this.mementos.push(memento);
  }

  pop(): EditorMemento | undefined {
    return this.mementos.pop();
  }
}

const editor = new Editor();
const editHistory = new EditHistory();

editor.type('Hello');
editHistory.push(editor.save());

editor.type(', world');
editHistory.push(editor.save());

editor.type('!!!');
console.log(editor.getContent());

editor.restore(editHistory.pop()!);
console.log(editor.getContent());

editor.restore(editHistory.pop()!);
console.log(editor.getContent());
