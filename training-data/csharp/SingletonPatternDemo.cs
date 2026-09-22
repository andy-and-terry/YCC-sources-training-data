using System;

sealed class AppConfig
{
    private static readonly Lazy<AppConfig> lazyInstance = new(() => new AppConfig());

    public static AppConfig Instance => lazyInstance.Value;

    public string Theme { get; set; } = "light";

    private AppConfig()
    {
    }
}

class SingletonPatternDemo
{
    static void Main()
    {
        AppConfig.Instance.Theme = "dark";
        Console.WriteLine(AppConfig.Instance.Theme);
        Console.WriteLine(ReferenceEquals(AppConfig.Instance, AppConfig.Instance));
    }
}
