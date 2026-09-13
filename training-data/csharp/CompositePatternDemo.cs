using System;
using System.Collections.Generic;

interface IFileSystemComponent
{
    int GetSize();
    void Print(string indent);
}

class FileLeaf : IFileSystemComponent
{
    private readonly string name;
    private readonly int size;

    public FileLeaf(string name, int size)
    {
        this.name = name;
        this.size = size;
    }

    public int GetSize() => size;

    public void Print(string indent) => Console.WriteLine($"{indent}{name} ({size})");
}

class DirectoryComposite : IFileSystemComponent
{
    private readonly string name;
    private readonly List<IFileSystemComponent> children = new();

    public DirectoryComposite(string name)
    {
        this.name = name;
    }

    public void Add(IFileSystemComponent component) => children.Add(component);

    public int GetSize()
    {
        int total = 0;
        foreach (var child in children) total += child.GetSize();
        return total;
    }

    public void Print(string indent)
    {
        Console.WriteLine($"{indent}{name}/");
        foreach (var child in children) child.Print(indent + "  ");
    }
}

class CompositePatternDemo
{
    static void Main()
    {
        var root = new DirectoryComposite("root");
        var docs = new DirectoryComposite("docs");
        docs.Add(new FileLeaf("readme.txt", 10));
        docs.Add(new FileLeaf("notes.txt", 5));
        root.Add(docs);
        root.Add(new FileLeaf("main.cs", 20));

        root.Print("");
        Console.WriteLine($"total size: {root.GetSize()}");
    }
}
