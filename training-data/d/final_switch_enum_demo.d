import std.stdio;

enum Color { red, green, blue }

string describe(Color c)
{
    // final switch requires every enum member to be handled.
    final switch (c)
    {
        case Color.red:   return "warm";
        case Color.green: return "natural";
        case Color.blue:  return "cool";
    }
}

void main()
{
    foreach (c; [Color.red, Color.green, Color.blue])
        writeln(c, " -> ", describe(c));

    // Ranges of cases work in a regular switch.
    int n = 7;
    switch (n)
    {
        case 1: .. case 5: writeln("low"); break;
        case 6: .. case 9: writeln("high"); break;
        default: writeln("other");
    }
}
