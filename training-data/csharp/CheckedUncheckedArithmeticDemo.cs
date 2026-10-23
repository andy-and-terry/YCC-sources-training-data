using System;

public static class CheckedUncheckedArithmeticDemo
{
    public static void Main()
    {
        int max = int.MaxValue;

        int wrapped = unchecked(max + 1);
        Console.WriteLine(wrapped);

        try
        {
            int boom = checked(max + 1);
            Console.WriteLine(boom);
        }
        catch (OverflowException)
        {
            Console.WriteLine("overflow detected");
        }

        checked
        {
            try
            {
                byte b = 200;
                b += 100;
                Console.WriteLine(b);
            }
            catch (OverflowException)
            {
                Console.WriteLine("byte overflow detected");
            }
        }
    }
}
