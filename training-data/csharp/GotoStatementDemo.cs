using System;

public static class GotoStatementDemo
{
    public static string Classify(int n)
    {
        switch (n)
        {
            case 1:
                Console.WriteLine("one");
                goto case 2;
            case 2:
                return "small";
            default:
                return "other";
        }
    }

    public static void Main()
    {
        Console.WriteLine(Classify(1));
        Console.WriteLine(Classify(2));
        Console.WriteLine(Classify(9));

        for (int i = 0; i < 3; i++)
        {
            for (int j = 0; j < 3; j++)
            {
                if (i * j == 2) goto Done;
                Console.WriteLine($"{i},{j}");
            }
        }
    Done:
        Console.WriteLine("exited nested loops");
    }
}
