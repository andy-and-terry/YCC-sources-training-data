using System;

public static class RotationCheck
{
    public static bool IsRotation(string a, string b) =>
        a.Length == b.Length && (a + a).Contains(b, StringComparison.Ordinal);

    public static void Main()
    {
        Console.WriteLine(IsRotation("waterbottle", "erbottlewat"));
        Console.WriteLine(IsRotation("abc", "acb"));
    }
}
