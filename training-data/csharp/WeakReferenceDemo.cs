using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

class WeakReferenceDemo
{
    class Big { public byte[] Data = new byte[1024]; }

    static WeakReference<Big> Create()
    {
        var b = new Big();
        return new WeakReference<Big>(b);
    }

    [MethodImpl(MethodImplOptions.NoInlining)]
    static void Main()
    {
        var strong = new Big();
        var weak = new WeakReference<Big>(strong);
        Console.WriteLine(weak.TryGetTarget(out _));

        strong = null!;
        GC.Collect();
        GC.WaitForPendingFinalizers();
        Console.WriteLine("target may be collected: " + (!weak.TryGetTarget(out _) || true));

        var table = new ConditionalWeakTable<object, string>();
        var key = new object();
        table.Add(key, "metadata");
        Console.WriteLine(table.TryGetValue(key, out var meta) + " " + meta);
        Console.WriteLine(GC.MaxGeneration);
    }
}
