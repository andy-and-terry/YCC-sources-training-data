using System;
using System.Collections.Generic;
using System.Linq;

class Emirps
{
    static bool IsPrime(long n)
    {
        if (n < 2) return false;
        for (long i = 2; i * i <= n; i++) if (n % i == 0) return false;
        return true;
    }

    static void Main()
    {
        var output = new List<long>();
        for (long n = 2; output.Count < 10; n++)
        {
            long r = long.Parse(new string(n.ToString().Reverse().ToArray()));
            if (r != n && IsPrime(n) && IsPrime(r)) output.Add(n);
        }
        Console.WriteLine(string.Join(" ", output)); // 13 17 31 37 71 73 79 97 107 113
    }
}
