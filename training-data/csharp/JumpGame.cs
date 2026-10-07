using System;

class JumpGame
{
    static bool CanJump(int[] a)
    {
        int reach = 0;
        for (int i = 0; i < a.Length; i++)
        {
            if (i > reach) return false;
            reach = Math.Max(reach, i + a[i]);
        }
        return true;
    }

    static int? MinJumps(int[] a)
    {
        int jumps = 0, end = 0, far = 0;
        for (int i = 0; i < a.Length - 1; i++)
        {
            far = Math.Max(far, i + a[i]);
            if (i != end) continue;
            if (far <= i) return null;
            jumps++;
            end = far;
        }
        return jumps;
    }

    static void Main()
    {
        int[] a = { 2, 3, 1, 1, 4 }, b = { 3, 2, 1, 0, 4 };
        Console.WriteLine($"{CanJump(a)} {CanJump(b)} {MinJumps(a)} {MinJumps(b)?.ToString() ?? "unreachable"}");
    }
}
