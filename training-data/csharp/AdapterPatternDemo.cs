using System;

interface IModernPrinter
{
    void Print(string text);
}

class LegacyPrinter
{
    public void PrintLegacy(string text) => Console.WriteLine($"[legacy] {text}");
}

class LegacyPrinterAdapter : IModernPrinter
{
    private readonly LegacyPrinter legacy;

    public LegacyPrinterAdapter(LegacyPrinter legacy) => this.legacy = legacy;

    public void Print(string text) => legacy.PrintLegacy(text);
}

class AdapterPatternDemo
{
    static void Main()
    {
        IModernPrinter printer = new LegacyPrinterAdapter(new LegacyPrinter());
        printer.Print("Hello via adapter");
    }
}
