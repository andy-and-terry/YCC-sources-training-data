using System;

var c = new Config { Host = "localhost", Port = 8080 };
Console.WriteLine($"{c.Host}:{c.Port}");

class Config
{
    public required string Host { get; init; }
    public int Port { get; init; } = 80;
}
