using System;

[Flags]
enum Permissions
{
    None = 0,
    Read = 1,
    Write = 2,
    Execute = 4,
    All = Read | Write | Execute
}

class FlagsEnumDemo
{
    static void Main()
    {
        var p = Permissions.Read | Permissions.Write;
        Console.WriteLine(p);
        Console.WriteLine(p.HasFlag(Permissions.Write));
        p &= ~Permissions.Write;
        Console.WriteLine(p);
        p ^= Permissions.Execute;
        Console.WriteLine(p);
        Console.WriteLine(Permissions.All);
        Console.WriteLine(Enum.Parse<Permissions>("Read, Execute") == (Permissions.Read | Permissions.Execute));
    }
}
