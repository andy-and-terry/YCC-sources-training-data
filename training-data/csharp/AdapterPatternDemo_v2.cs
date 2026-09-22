using System;

interface ITarget
{
    string Request();
}

class LegacyPrinter
{
    public string PrintLegacy() => "legacy output";
}

class PrinterAdapter : ITarget
{
    private readonly LegacyPrinter legacy;
    public PrinterAdapter(LegacyPrinter legacy) => this.legacy = legacy;
    public string Request() => $"adapted: {legacy.PrintLegacy()}";
}

class AdapterPatternDemo
{
    static void Main()
    {
        ITarget target = new PrinterAdapter(new LegacyPrinter());
        Console.WriteLine(target.Request());
    }
}
