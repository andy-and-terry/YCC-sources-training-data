using System;

static class SternDiatomic
{
    static int[] Stern(int count)
    {
        var seq = new int[Math.Max(count, 2)];
        seq[1] = 1;
        for (int i = 2; i < count; i++)
            seq[i] = i % 2 == 0 ? seq[i / 2] : seq[i / 2] + seq[i / 2 + 1];
        return seq[..count];
    }

    static void Main() => Console.WriteLine(string.Join(" ", Stern(15))); // 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
}
