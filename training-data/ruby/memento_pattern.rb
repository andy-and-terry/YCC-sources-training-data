Memento = Struct.new(:content)

class Editor
  attr_reader :content

  def initialize
    @content = ""
  end

  def type(text)
    @content += text
  end

  def save
    Memento.new(@content)
  end

  def restore(memento)
    @content = memento.content
  end
end

class History
  def initialize
    @mementos = []
  end

  def push(memento)
    @mementos << memento
  end

  def pop
    @mementos.pop
  end
end

editor = Editor.new
history = History.new

editor.type("Hello")
history.push(editor.save)
editor.type(", world")
history.push(editor.save)
editor.type("!!!")

puts editor.content
editor.restore(history.pop)
puts editor.content
editor.restore(history.pop)
puts editor.content
