using System;

class SpanSlicing {
    static void Main() {
        int[] arr = { 1, 2, 3, 4, 5 };
        Span<int> mid = arr.AsSpan(1, 3);
        mid[0] = 99;
        Console.WriteLine(string.Join(",", arr));
    }
}
