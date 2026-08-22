using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

class ValidationException : Exception
{
    public Dictionary<string, List<string>> Errors;
    public ValidationException(Dictionary<string, List<string>> errors) : base("validation failed") => Errors = errors;
}

class SimpleValidatorDemo
{
    static bool Required(string value) => !string.IsNullOrEmpty(value);
    static bool IsEmail(string value) => value != null && Regex.IsMatch(value, @"^[^@\s]+@[^@\s]+\.[^@\s]+$");
    static Func<string, bool> MinLength(int n) => value => value != null && value.Length >= n;

    static void Validate(Dictionary<string, string> data, Dictionary<string, List<Func<string, bool>>> schema)
    {
        var errors = new Dictionary<string, List<string>>();
        foreach (var (field, rules) in schema)
        {
            foreach (var rule in rules)
            {
                data.TryGetValue(field, out var value);
                if (!rule(value))
                {
                    if (!errors.ContainsKey(field)) errors[field] = new List<string>();
                    errors[field].Add("invalid");
                }
            }
        }
        if (errors.Count > 0) throw new ValidationException(errors);
    }

    static void Main()
    {
        var data = new Dictionary<string, string> { { "email", "not-an-email" }, { "password", "short" } };
        var schema = new Dictionary<string, List<Func<string, bool>>>
        {
            { "email", new List<Func<string, bool>> { Required, IsEmail } },
            { "password", new List<Func<string, bool>> { Required, MinLength(8) } },
        };
        try
        {
            Validate(data, schema);
        }
        catch (ValidationException e)
        {
            foreach (var (field, errs) in e.Errors) Console.WriteLine($"{field}: {string.Join(",", errs)}");
        }
    }
}
