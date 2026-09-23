using System;
using System.Collections;
using System.Collections.Generic;

class SteppedRange : IEnumerable<int>
{
    private readonly int start, end, step;

    public SteppedRange(int start, int end, int step)
    {
        this.start = start;
        this.end = end;
        this.step = step;
    }

    public IEnumerator<int> GetEnumerator() => new SteppedRangeEnumerator(start, end, step);

    IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();

    private class SteppedRangeEnumerator : IEnumerator<int>
    {
        private readonly int end, step;
        private int current;

        public SteppedRangeEnumerator(int start, int end, int step)
        {
            current = start - step;
            this.end = end;
            this.step = step;
        }

        public int Current => current;
        object IEnumerator.Current => Current;

        public bool MoveNext()
        {
            current += step;
            return step > 0 ? current < end : current > end;
        }

        public void Reset() => throw new NotSupportedException();

        public void Dispose() { }
    }
}

class CustomEnumeratorDemo
{
    static void Main()
    {
        var range = new SteppedRange(0, 20, 3);
        foreach (int n in range) Console.Write($"{n} ");
        Console.WriteLine();

        var countdown = new SteppedRange(10, 0, -2);
        foreach (int n in countdown) Console.Write($"{n} ");
        Console.WriteLine();
    }
}
