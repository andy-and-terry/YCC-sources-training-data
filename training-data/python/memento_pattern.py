from copy import deepcopy
from typing import Any, List


class Memento:
    def __init__(self, state: Any):
        self._state = deepcopy(state)

    def get_state(self) -> Any:
        return deepcopy(self._state)


class TextEditor:
    def __init__(self):
        self._content = ""

    def type(self, text: str):
        self._content += text

    def save(self) -> Memento:
        return Memento(self._content)

    def restore(self, memento: Memento):
        self._content = memento.get_state()

    @property
    def content(self) -> str:
        return self._content


class History:
    def __init__(self):
        self._mementos: List[Memento] = []

    def push(self, memento: Memento):
        self._mementos.append(memento)

    def pop(self) -> Memento:
        return self._mementos.pop()


if __name__ == "__main__":
    editor = TextEditor()
    history = History()

    editor.type("Hello")
    history.push(editor.save())
    editor.type(", world!")
    history.push(editor.save())
    editor.type(" Extra text.")

    print(editor.content)
    editor.restore(history.pop())
    print(editor.content)
    editor.restore(history.pop())
    print(editor.content)
