using System;

public static class AlternatingDigitSum
{
    static int AlternatingDigitSum(int n)
    {
        int total = 0, sign = 1;
        for (; n > 0; n /= 10, sign = -sign) total += sign * (n % 10);
        return total;
    }

    public static void Main()
    {
        foreach (var n in new[] { 1234, 99999, 1000 })
            Console.WriteLine($"{n} {AlternatingDigitSum(n)}");
    }
}
