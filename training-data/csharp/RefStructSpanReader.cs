using System;

public ref struct SpanReader
{
    private ReadOnlySpan<char> _rest;

    public SpanReader(ReadOnlySpan<char> text) => _rest = text;

    public bool TryReadToken(char separator, out ReadOnlySpan<char> token)
    {
        if (_rest.IsEmpty)
        {
            token = default;
            return false;
        }
        int idx = _rest.IndexOf(separator);
        if (idx < 0)
        {
            token = _rest;
            _rest = default;
        }
        else
        {
            token = _rest.Slice(0, idx);
            _rest = _rest.Slice(idx + 1);
        }
        return true;
    }
}

public static class RefStructSpanReader
{
    public static void Main()
    {
        var reader = new SpanReader("alpha,beta,gamma");
        while (reader.TryReadToken(',', out var token))
            Console.WriteLine(token.ToString());
    }
}
