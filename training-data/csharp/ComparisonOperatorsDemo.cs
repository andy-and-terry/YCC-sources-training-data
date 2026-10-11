using System;
using System.Collections.Generic;

class ComparisonOperatorsDemo
{
    readonly struct Version : IComparable<Version>, IEquatable<Version>
    {
        public int Major { get; }
        public int Minor { get; }
        public Version(int major, int minor) { Major = major; Minor = minor; }

        public int CompareTo(Version o) => Major != o.Major ? Major.CompareTo(o.Major) : Minor.CompareTo(o.Minor);
        public bool Equals(Version o) => Major == o.Major && Minor == o.Minor;
        public override bool Equals(object? obj) => obj is Version v && Equals(v);
        public override int GetHashCode() => HashCode.Combine(Major, Minor);
        public override string ToString() => $"{Major}.{Minor}";

        public static bool operator <(Version a, Version b) => a.CompareTo(b) < 0;
        public static bool operator >(Version a, Version b) => a.CompareTo(b) > 0;
        public static bool operator <=(Version a, Version b) => a.CompareTo(b) <= 0;
        public static bool operator >=(Version a, Version b) => a.CompareTo(b) >= 0;
        public static bool operator ==(Version a, Version b) => a.Equals(b);
        public static bool operator !=(Version a, Version b) => !a.Equals(b);
    }

    static void Main()
    {
        var list = new List<Version> { new(1, 10), new(1, 2), new(0, 9), new(2, 0) };
        list.Sort();
        Console.WriteLine(string.Join(" < ", list));
        Console.WriteLine(new Version(1, 2) < new Version(1, 10));
        Console.WriteLine(new Version(3, 1) == new Version(3, 1));
    }
}
