using System;
using System.Collections.Generic;
using System.Globalization;
using System.Text;

class SimpleJsonParser
{
    private readonly string text;
    private int pos;

    public SimpleJsonParser(string text) => this.text = text;

    public static object Parse(string text)
    {
        var parser = new SimpleJsonParser(text);
        parser.SkipWhitespace();
        return parser.ParseValue();
    }

    private object ParseValue()
    {
        SkipWhitespace();
        char c = text[pos];
        if (c == '{') return ParseObject();
        if (c == '[') return ParseArray();
        if (c == '"') return ParseString();
        if (c == 't') { pos += 4; return true; }
        if (c == 'f') { pos += 5; return false; }
        if (c == 'n') { pos += 4; return null; }
        return ParseNumber();
    }

    private Dictionary<string, object> ParseObject()
    {
        var result = new Dictionary<string, object>();
        pos++;
        SkipWhitespace();
        if (text[pos] == '}') { pos++; return result; }
        while (true)
        {
            SkipWhitespace();
            string key = ParseString();
            SkipWhitespace();
            pos++;
            result[key] = ParseValue();
            SkipWhitespace();
            if (text[pos] == ',') { pos++; continue; }
            pos++;
            break;
        }
        return result;
    }

    private List<object> ParseArray()
    {
        var result = new List<object>();
        pos++;
        SkipWhitespace();
        if (text[pos] == ']') { pos++; return result; }
        while (true)
        {
            result.Add(ParseValue());
            SkipWhitespace();
            if (text[pos] == ',') { pos++; continue; }
            pos++;
            break;
        }
        return result;
    }

    private string ParseString()
    {
        pos++;
        var sb = new StringBuilder();
        while (text[pos] != '"')
        {
            sb.Append(text[pos]);
            pos++;
        }
        pos++;
        return sb.ToString();
    }

    private double ParseNumber()
    {
        int start = pos;
        while (pos < text.Length && (char.IsDigit(text[pos]) || text[pos] == '-' || text[pos] == '.'))
            pos++;
        return double.Parse(text[start..pos], CultureInfo.InvariantCulture);
    }

    private void SkipWhitespace()
    {
        while (pos < text.Length && char.IsWhiteSpace(text[pos])) pos++;
    }
}

class SimpleJsonParserDemo
{
    static void Main()
    {
        var result = (Dictionary<string, object>)SimpleJsonParser.Parse(
            "{\"name\": \"Ada\", \"age\": 36, \"active\": true, \"tags\": [\"math\", \"code\"]}");

        Console.WriteLine(result["name"]);
        Console.WriteLine(result["age"]);
        Console.WriteLine(result["active"]);
        Console.WriteLine(string.Join(",", (List<object>)result["tags"]));
    }
}
