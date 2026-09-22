using System;

class ConfigManager
{
    private static readonly Lazy<ConfigManager> instance =
        new Lazy<ConfigManager>(() => new ConfigManager());

    public static ConfigManager Instance => instance.Value;

    public string Environment { get; set; }

    private ConfigManager()
    {
        Environment = "production";
    }
}

class SingletonPatternDemo
{
    static void Main()
    {
        ConfigManager.Instance.Environment = "staging";
        Console.WriteLine(ConfigManager.Instance.Environment);
        Console.WriteLine(ReferenceEquals(ConfigManager.Instance, ConfigManager.Instance));
    }
}
