using System;

class SierpinskiTriangle
{
    static void Main()
    {
        int n = 8;
        for (int r = 0; r < n; r++)
        {
            Console.Write(new string(' ', n - r - 1));
            for (int c = 0; c <= r; c++)
                Console.Write((r & c) == c ? "* " : "  ");
            Console.WriteLine();
        }
    }
}
