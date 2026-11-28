using System;

class BitapSearch
{
    static int Bitap(string text, string pat)
    {
        var masks = new ulong[65536];
        for (int i = 0; i < pat.Length; i++) masks[pat[i]] |= 1UL << i;
        ulong state = 0, goal = 1UL << (pat.Length - 1);
        for (int i = 0; i < text.Length; i++)
        {
            state = ((state << 1) | 1) & masks[text[i]];
            if ((state & goal) != 0) return i - pat.Length + 1;
        }
        return -1;
    }

    static void Main() => Console.WriteLine(Bitap("the quick brown fox", "brown"));
}
