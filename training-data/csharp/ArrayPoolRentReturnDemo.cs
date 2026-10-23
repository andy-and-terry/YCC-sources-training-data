using System;
using System.Buffers;

// ArrayPool<T> reuses large arrays to avoid repeated allocations.
class Program
{
    static int SumSquares(int count)
    {
        // Rent may return a bigger array than requested
        int[] buffer = ArrayPool<int>.Shared.Rent(count);
        try
        {
            Console.WriteLine($"asked {count}, got length >= {count}: {buffer.Length >= count}");
            for (int i = 0; i < count; i++)
                buffer[i] = i * i;

            int sum = 0;
            for (int i = 0; i < count; i++)
                sum += buffer[i];
            return sum;
        }
        finally
        {
            // clearArray avoids leaking old data to the next renter
            ArrayPool<int>.Shared.Return(buffer, clearArray: true);
        }
    }

    static void Main()
    {
        Console.WriteLine(SumSquares(10));
        Console.WriteLine(SumSquares(1000));

        // Work with exactly the requested slice via Span
        var bytes = ArrayPool<byte>.Shared.Rent(16);
        Span<byte> view = bytes.AsSpan(0, 4);
        view.Fill(7);
        Console.WriteLine(string.Join(",", view.ToArray()));
        ArrayPool<byte>.Shared.Return(bytes);
    }
}
