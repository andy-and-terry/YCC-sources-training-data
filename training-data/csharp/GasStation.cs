using System;

class GasStation
{
    static int Start(int[] gas, int[] cost)
    {
        int total = 0, tank = 0, start = 0;
        for (int i = 0; i < gas.Length; i++)
        {
            int d = gas[i] - cost[i];
            total += d;
            tank += d;
            if (tank < 0) (start, tank) = (i + 1, 0);
        }
        return total < 0 ? -1 : start;
    }

    static void Main() => Console.WriteLine($"{Start(new[] { 1, 2, 3, 4, 5 }, new[] { 3, 4, 5, 1, 2 })} {Start(new[] { 2, 3, 4 }, new[] { 3, 4, 3 })}");
}
