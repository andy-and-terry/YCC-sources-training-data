using System;
using System.Collections.Generic;

class Version2 : IComparable<Version2>
{
    public int Major { get; }
    public int Minor { get; }
    public Version2(int major, int minor) { Major = major; Minor = minor; }

    public int CompareTo(Version2? other)
    {
        if (other is null) return 1;
        int c = Major.CompareTo(other.Major);
        return c != 0 ? c : Minor.CompareTo(other.Minor);
    }

    public override string ToString() => $"{Major}.{Minor}";
}

class IComparableSortDemo
{
    static void Main()
    {
        var list = new List<Version2> { new(1, 10), new(1, 2), new(0, 9), new(2, 0) };
        list.Sort();
        Console.WriteLine(string.Join(" ", list));

        list.Sort(Comparer<Version2>.Create((a, b) => b.CompareTo(a)));
        Console.WriteLine(string.Join(" ", list));

        Console.WriteLine(list.BinarySearch(new Version2(9, 9), Comparer<Version2>.Create((a, b) => b.CompareTo(a))) < 0);
    }
}
