using System;
using System.Linq;

public static class HappyNumber
{
    static int Step(int n)
    {
        var s = 0;
        for (; n > 0; n /= 10) s += (n % 10) * (n % 10);
        return s;
    }

    public static bool IsHappy(int n)
    {
        int slow = n, fast = Step(n);
        while (fast != 1 && slow != fast)
        {
            slow = Step(slow);
            fast = Step(Step(fast));
        }
        return fast == 1;
    }

    public static void Main() => Console.WriteLine(string.Join(" ", Enumerable.Range(1, 50).Where(IsHappy)));
}
