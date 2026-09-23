extends Node

class Memento:
	var state: String

	func _init(s: String):
		state = s

class TextEditor:
	var content: String = ""

	func type_text(text: String) -> void:
		content += text

	func save() -> Memento:
		return Memento.new(content)

	func restore(memento: Memento) -> void:
		content = memento.state

class History:
	var mementos: Array = []

	func push(m: Memento) -> void:
		mementos.append(m)

	func pop() -> Memento:
		if mementos.is_empty():
			return null
		return mementos.pop_back()

func _ready():
	var editor = TextEditor.new()
	var history = History.new()

	editor.type_text("Hello")
	history.push(editor.save())
	editor.type_text(", World!")
	print(editor.content)

	editor.restore(history.pop())
	print(editor.content)
