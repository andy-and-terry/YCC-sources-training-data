class EditorState {
  constructor(text) {
    this.text = text;
  }
}

class Editor {
  constructor() {
    this.text = '';
  }

  type(words) {
    this.text += words;
  }

  save() {
    return new EditorState(this.text);
  }

  restore(state) {
    this.text = state.text;
  }
}

class History {
  constructor() {
    this.states = [];
  }

  push(state) {
    this.states.push(state);
  }

  pop() {
    return this.states.pop();
  }
}

const editor = new Editor();
const history = new History();

editor.type('Hello');
history.push(editor.save());
editor.type(', world');
history.push(editor.save());
editor.type('!!!');
console.log(editor.text);

editor.restore(history.pop());
console.log(editor.text);
editor.restore(history.pop());
console.log(editor.text);
module.exports = { Editor, History, EditorState };
