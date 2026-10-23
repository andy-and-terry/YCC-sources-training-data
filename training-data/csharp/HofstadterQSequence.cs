using System;

public static class HofstadterQSequence
{
    public static int[] Q(int count)
    {
        var q = new int[count + 1];
        q[1] = 1;
        q[2] = 1;
        for (int n = 3; n <= count; n++)
            q[n] = q[n - q[n - 1]] + q[n - q[n - 2]];
        return q[1..];
    }

    public static void Main()
    {
        Console.WriteLine(string.Join(" ", Q(20)));
    }
}
