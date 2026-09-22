using System;
using System.Collections.Generic;

class EditorMemento
{
    public string Content { get; }
    public EditorMemento(string content) { Content = content; }
}

class Editor
{
    public string Content { get; set; } = "";

    public EditorMemento Save()
    {
        return new EditorMemento(Content);
    }

    public void Restore(EditorMemento memento)
    {
        Content = memento.Content;
    }
}

class History
{
    private readonly Stack<EditorMemento> snapshots = new Stack<EditorMemento>();

    public void Push(EditorMemento memento) => snapshots.Push(memento);
    public EditorMemento Pop() => snapshots.Pop();
}

class MementoPatternDemo
{
    static void Main()
    {
        var editor = new Editor();
        var history = new History();

        editor.Content = "draft one";
        history.Push(editor.Save());

        editor.Content = "draft two";
        history.Push(editor.Save());

        editor.Content = "draft three";
        Console.WriteLine("current: " + editor.Content);

        editor.Restore(history.Pop());
        Console.WriteLine("after undo: " + editor.Content);

        editor.Restore(history.Pop());
        Console.WriteLine("after undo: " + editor.Content);
    }
}
