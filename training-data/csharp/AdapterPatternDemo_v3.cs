using System;

interface IModernPrinter
{
    void Print(string text);
}

class LegacyPrinter
{
    public void OldPrint(string text) => Console.WriteLine($"[legacy] {text}");
}

class PrinterAdapter : IModernPrinter
{
    private readonly LegacyPrinter legacy;

    public PrinterAdapter(LegacyPrinter legacy) => this.legacy = legacy;

    public void Print(string text) => legacy.OldPrint(text);
}

class AdapterPatternDemo_v3
{
    static void Main()
    {
        IModernPrinter printer = new PrinterAdapter(new LegacyPrinter());
        printer.Print("hello via adapter");
    }
}
