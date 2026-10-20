using System;

partial class Report
{
    public string Title { get; set; } = "T";
    partial void OnRender();
    public void Render() { Console.WriteLine("render " + Title); OnRender(); }
}

partial class Report
{
    partial void OnRender() { Console.WriteLine("hook called"); }
}

class PartialClassesAndStaticLocals
{
    static void Main()
    {
        new Report().Render();
        static int Twice(int x) => x * 2;
        Console.WriteLine(Twice(21));
    }
}
