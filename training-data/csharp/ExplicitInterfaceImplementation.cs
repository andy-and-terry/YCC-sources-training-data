using System;

class ExplicitInterfaceImplementation
{
    interface IDrawable { string Draw(); }
    interface IPrintable { string Draw(); }

    class Report : IDrawable, IPrintable
    {
        string IDrawable.Draw() => "drawing on screen";
        string IPrintable.Draw() => "sending to printer";
        public string Draw() => "plain Draw";
    }

    static void Main()
    {
        var r = new Report();
        Console.WriteLine(r.Draw());
        Console.WriteLine(((IDrawable)r).Draw());
        IPrintable p = r;
        Console.WriteLine(p.Draw());
        Console.WriteLine(r is IDrawable && r is IPrintable);
    }
}
