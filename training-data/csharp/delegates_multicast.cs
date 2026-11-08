using System;

class DelegatesMulticast
{
    delegate void Notify(string msg);

    static void Main()
    {
        Notify n = m => Console.WriteLine("A: " + m);
        n += m => Console.WriteLine("B: " + m);
        n("hello");
        Func<int, int> twice = x => x * 2;
        Func<int, int> inc = x => x + 1;
        Console.WriteLine(twice(inc(5)));
    }
}
