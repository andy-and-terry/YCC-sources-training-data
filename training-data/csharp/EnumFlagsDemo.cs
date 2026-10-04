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

class EnumFlagsDemo
{
    static void Main()
    {
        var p = Permissions.Read | Permissions.Write;
        Console.WriteLine(p);
        Console.WriteLine(p.HasFlag(Permissions.Write));
        Console.WriteLine(p.HasFlag(Permissions.Execute));

        p |= Permissions.Execute;
        Console.WriteLine(p == Permissions.All);

        p &= ~Permissions.Write;
        Console.WriteLine(p);

        Console.WriteLine((int)p);
        Console.WriteLine(Enum.Parse<Permissions>("Read, Execute"));
    }
}
