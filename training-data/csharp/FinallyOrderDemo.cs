using System;

class FinallyOrderDemo
{
    static int WithFinally()
    {
        try
        {
            Console.WriteLine("try");
            return 1;
        }
        finally
        {
            Console.WriteLine("finally runs before the caller sees the return");
        }
    }

    static void Nested()
    {
        try
        {
            try
            {
                throw new InvalidOperationException("inner");
            }
            finally
            {
                Console.WriteLine("inner finally");
            }
        }
        catch (InvalidOperationException e)
        {
            Console.WriteLine("caught " + e.Message);
        }
        finally
        {
            Console.WriteLine("outer finally");
        }
    }

    static void Main()
    {
        Console.WriteLine(WithFinally());
        Nested();
    }
}
