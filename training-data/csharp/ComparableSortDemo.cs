using System;
using System.Collections.Generic;

class Version : IComparable<Version>
{
    public int Major { get; }
    public int Minor { get; }

    public Version(int major, int minor)
    {
        Major = major;
        Minor = minor;
    }

    public int CompareTo(Version other)
    {
        if (other is null) return 1;
        int byMajor = Major.CompareTo(other.Major);
        return byMajor != 0 ? byMajor : Minor.CompareTo(other.Minor);
    }

    public override string ToString() => $"{Major}.{Minor}";
}

class ComparableSortDemo
{
    static void Main()
    {
        var versions = new List<Version>
        {
            new Version(2, 1), new Version(1, 9), new Version(2, 0), new Version(1, 10)
        };
        versions.Sort();
        Console.WriteLine(string.Join(", ", versions));

        versions.Sort((a, b) => b.CompareTo(a));
        Console.WriteLine(string.Join(", ", versions));
    }
}
