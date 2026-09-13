using System;
using System.Collections.Generic;

class EditorMemento
{
    public string Content { get; }
    public EditorMemento(string content) => Content = content;
}

class TextEditor
{
    public string Content { get; private set; } = "";

    public void Type(string text) => Content += text;

    public EditorMemento Save() => new EditorMemento(Content);

    public void Restore(EditorMemento memento) => Content = memento.Content;
}

class EditorHistory
{
    private readonly Stack<EditorMemento> history = new();

    public void Push(EditorMemento memento) => history.Push(memento);

    public EditorMemento Pop() => history.Pop();
}

class MementoPatternDemo
{
    static void Main()
    {
        var editor = new TextEditor();
        var history = new EditorHistory();

        editor.Type("Hello");
        history.Push(editor.Save());

        editor.Type(", world");
        history.Push(editor.Save());

        editor.Type("!!!");
        Console.WriteLine(editor.Content);

        editor.Restore(history.Pop());
        Console.WriteLine(editor.Content);

        editor.Restore(history.Pop());
        Console.WriteLine(editor.Content);
    }
}
