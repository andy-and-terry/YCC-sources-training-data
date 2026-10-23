import std.stdio;

void main()
{
    int i = 0;
retry:
    i++;
    writeln("attempt ", i);
    if (i < 3)
        goto retry;

    foreach (x; 0 .. 5)
    {
        switch (x)
        {
            case 2:
                goto case 3;
            case 3:
                writeln("two or three: ", x);
                break;
            default:
                goto default_end;
        }
    default_end:
        continue;
    }

outer:
    foreach (a; 0 .. 3)
        foreach (b; 0 .. 3)
        {
            if (a * b == 2)
                break outer;
            writeln(a, ",", b);
        }
}
