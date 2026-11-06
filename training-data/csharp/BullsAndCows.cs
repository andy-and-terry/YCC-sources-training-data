// Bulls and Cows scoring for equal-length digit strings.
using System;

class BullsAndCows
{
    static (int Bulls, int Cows) Score(string secret, string guess)
    {
        int bulls = 0, cows = 0;
        var sc = new int[10];
        var gc = new int[10];
        for (int i = 0; i < secret.Length; i++)
        {
            if (secret[i] == guess[i]) bulls++;
            else { sc[secret[i] - '0']++; gc[guess[i] - '0']++; }
        }
        for (int d = 0; d < 10; d++) cows += Math.Min(sc[d], gc[d]);
        return (bulls, cows);
    }

    static void Main()
    {
        var (b, c) = Score("1807", "7810");
        Console.WriteLine($"{b} bull(s), {c} cow(s)");
    }
}
