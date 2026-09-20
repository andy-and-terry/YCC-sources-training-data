using System;

class Configuration
{
    public string Host { get; init; } = "localhost";
    public int Port { get; init; } = 80;
    public bool UseTls { get; init; }
}

class InitOnlyPropertiesDemo
{
    static void Main()
    {
        var config = new Configuration { Host = "example.com", Port = 443, UseTls = true };
        Console.WriteLine($"{config.Host}:{config.Port} (tls={config.UseTls})");

        var defaultConfig = new Configuration();
        Console.WriteLine($"{defaultConfig.Host}:{defaultConfig.Port} (tls={defaultConfig.UseTls})");

        // config.Port = 8080; // would fail to compile: init-only property can't be set after construction
    }
}
