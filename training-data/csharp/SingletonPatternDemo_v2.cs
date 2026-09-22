using System;
using System.Collections.Generic;

sealed class AppConfig
{
    private static readonly Lazy<AppConfig> lazyInstance = new(() => new AppConfig());
    public static AppConfig Instance => lazyInstance.Value;

    public Dictionary<string, string> Settings { get; } = new() { ["env"] = "production" };

    private AppConfig() { }
}

class SingletonPatternDemo
{
    static void Main()
    {
        AppConfig.Instance.Settings["region"] = "us-east";
        Console.WriteLine(AppConfig.Instance.Settings["region"]);
        Console.WriteLine(ReferenceEquals(AppConfig.Instance, AppConfig.Instance));
    }
}
