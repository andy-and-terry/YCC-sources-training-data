using System;

[Flags]
enum Access { None = 0, Read = 1, Write = 2, Exec = 4, All = Read | Write | Exec }

class FlagsEnumBitwise
{
    static void Main()
    {
        var a = Access.Read | Access.Write;
        Console.WriteLine(a + " " + a.HasFlag(Access.Write) + " " + (a & Access.Exec) + " " + (int)a);
        a &= ~Access.Write;
        Console.WriteLine(a + " " + Enum.Parse<Access>("Read, Exec") + " " + Access.All);
        foreach (var v in Enum.GetValues<Access>()) Console.Write((int)v + " ");
        Console.WriteLine();
    }
}
