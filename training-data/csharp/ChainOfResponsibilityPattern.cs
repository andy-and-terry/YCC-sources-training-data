using System;

abstract class Handler
{
    protected Handler Next;

    public Handler SetNext(Handler next)
    {
        Next = next;
        return next;
    }

    public virtual void Handle(int severity, string message)
    {
        Next?.Handle(severity, message);
    }
}

class InfoHandler : Handler
{
    public override void Handle(int severity, string message)
    {
        if (severity <= 1)
            Console.WriteLine("[INFO] " + message);
        else
            base.Handle(severity, message);
    }
}

class WarningHandler : Handler
{
    public override void Handle(int severity, string message)
    {
        if (severity == 2)
            Console.WriteLine("[WARNING] " + message);
        else
            base.Handle(severity, message);
    }
}

class ErrorHandler : Handler
{
    public override void Handle(int severity, string message)
    {
        if (severity >= 3)
            Console.WriteLine("[ERROR] " + message);
        else
            base.Handle(severity, message);
    }
}

class ChainOfResponsibilityPattern
{
    static void Main()
    {
        var info = new InfoHandler();
        var warning = new WarningHandler();
        var error = new ErrorHandler();
        info.SetNext(warning).SetNext(error);

        info.Handle(1, "system started");
        info.Handle(2, "disk space low");
        info.Handle(3, "out of memory");
    }
}
