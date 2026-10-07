using System;

class GrayCode
{
    static int ToGray(int n) => n ^ (n >> 1);

    static int FromGray(int g)
    {
        int n = 0;
        for (; g != 0; g >>= 1)
            n ^= g;
        return n;
    }

    static void Main()
    {
        for (int i = 0; i < 8; i++)
        {
            int g = ToGray(i);
            Console.WriteLine($"{i} -> {Convert.ToString(g, 2).PadLeft(3, '0')} -> {FromGray(g)}");
        }
    }
}
