using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;

public class Roster
{
    private readonly List<string> _names = new();

    public ReadOnlyCollection<string> Names => _names.AsReadOnly();

    public void Add(string name) => _names.Add(name);
}

public static class ReadOnlyCollectionDemo
{
    public static void Main()
    {
        var roster = new Roster();
        roster.Add("Ann");
        roster.Add("Bo");

        var view = roster.Names;
        Console.WriteLine(string.Join(", ", view));

        roster.Add("Cy");
        Console.WriteLine(view.Count);

        try
        {
            ((IList<string>)view).Add("Dee");
        }
        catch (NotSupportedException)
        {
            Console.WriteLine("collection is read-only");
        }
    }
}
