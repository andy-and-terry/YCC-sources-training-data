using System;

public interface ILogger
{
    void Log(string message);

    // Default implementation supplied by the interface itself
    void LogError(string message) => Log("ERROR: " + message);
}

public class ConsoleLogger : ILogger
{
    public void Log(string message) => Console.WriteLine(message);
}

public static class DefaultInterfaceMethods
{
    public static void Main()
    {
        ILogger logger = new ConsoleLogger();
        logger.Log("started");
        logger.LogError("disk full");
    }
}
