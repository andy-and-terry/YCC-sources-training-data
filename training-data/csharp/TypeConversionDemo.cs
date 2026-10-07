using System;

class TypeConversionDemo
{
    static void Main()
    {
        int i = 300;
        long widened = i;
        byte narrowed = unchecked((byte)i);
        Console.WriteLine($"{widened} {narrowed}");

        try
        {
            byte safe = checked((byte)i);
            Console.WriteLine(safe);
        }
        catch (OverflowException)
        {
            Console.WriteLine("overflow detected");
        }

        object boxed = 3.7;
        double d = (double)boxed;
        Console.WriteLine((int)d);
        Console.WriteLine(Math.Round(d));
        Console.WriteLine(Convert.ToInt32("123") + 1);
        Console.WriteLine(Convert.ToString(255, 2));
        Console.WriteLine(boxed is int);
        Console.WriteLine(boxed as string ?? "not a string");
    }
}
