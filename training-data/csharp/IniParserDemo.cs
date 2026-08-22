using System;
using System.Collections.Generic;

class IniParserDemo
{
    static Dictionary<string, Dictionary<string, string>> ParseIni(string text)
    {
        var result = new Dictionary<string, Dictionary<string, string>>();
        string section = null;
        foreach (var rawLine in text.Split('\n'))
        {
            var line = rawLine.Trim();
            if (line.Length == 0 || line.StartsWith("#") || line.StartsWith(";")) continue;
            if (line.StartsWith("[") && line.EndsWith("]"))
            {
                section = line.Substring(1, line.Length - 2);
                result[section] = new Dictionary<string, string>();
            }
            else if (line.Contains("=") && section != null)
            {
                var parts = line.Split('=', 2);
                result[section][parts[0].Trim()] = parts[1].Trim();
            }
        }
        return result;
    }

    static void Main()
    {
        var sample = "\n[server]\nhost = localhost\nport = 8080\n";
        foreach (var (section, kv) in ParseIni(sample))
        {
            Console.WriteLine($"[{section}]");
            foreach (var (k, v) in kv) Console.WriteLine($"{k}={v}");
        }
    }
}
