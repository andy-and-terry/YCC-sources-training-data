using System;
using System.Linq;

class KaprekarRoutine
{
    // One step: sort digits descending and ascending, then subtract.
    static int Step(int n)
    {
        var digits = n.ToString("D4").OrderBy(c => c).ToArray();
        int asc = int.Parse(new string(digits));
        int desc = int.Parse(new string(digits.Reverse().ToArray()));
        return desc - asc;
    }

    static int IterationsToConstant(int n)
    {
        int count = 0;
        while (n != 6174)
        {
            n = Step(n);
            count++;
            if (n == 0) return -1; // repdigit, never converges
        }
        return count;
    }

    static void Main()
    {
        int x = 3524;
        Console.Write(x);
        while (x != 6174)
        {
            x = Step(x);
            Console.Write($" -> {x}");
        }
        Console.WriteLine();

        var worst = Enumerable.Range(1000, 9000)
            .Select(n => (n, steps: IterationsToConstant(n)))
            .Where(t => t.steps >= 0)
            .MaxBy(t => t.steps);
        Console.WriteLine($"Slowest start: {worst.n} takes {worst.steps} steps");
    }
}
