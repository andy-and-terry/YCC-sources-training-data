using System;
using System.Text.Json;
using System.Text.Json.Serialization;

record Item([property: JsonPropertyName("item_id")] int Id, string Name, [property: JsonIgnore] string Secret = "");

class TextJsonSerializeRoundTrip
{
    static void Main()
    {
        var opts = new JsonSerializerOptions { WriteIndented = false, PropertyNamingPolicy = JsonNamingPolicy.CamelCase };
        string json = JsonSerializer.Serialize(new Item(1, "pen", "hide"), opts);
        Console.WriteLine(json);
        var back = JsonSerializer.Deserialize<Item>(json, opts);
        Console.WriteLine(back);
        using var doc = JsonDocument.Parse("{\"a\":{\"b\":[1,2,3]}}");
        Console.WriteLine(doc.RootElement.GetProperty("a").GetProperty("b")[2].GetInt32());
    }
}
