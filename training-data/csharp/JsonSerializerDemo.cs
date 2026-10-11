using System;
using System.Collections.Generic;
using System.Text.Json;
using System.Text.Json.Serialization;

class JsonSerializerDemo
{
    record Item(string Name, decimal Price, [property: JsonPropertyName("qty")] int Quantity);

    class Order
    {
        public int Id { get; set; }
        public List<Item> Items { get; set; } = new();
        [JsonIgnore] public string Secret { get; set; } = "hidden";
    }

    static void Main()
    {
        var order = new Order { Id = 7, Items = { new Item("pen", 1.5m, 10), new Item("book", 12m, 1) } };
        var options = new JsonSerializerOptions { WriteIndented = false, PropertyNamingPolicy = JsonNamingPolicy.CamelCase };

        string json = JsonSerializer.Serialize(order, options);
        Console.WriteLine(json);

        var back = JsonSerializer.Deserialize<Order>(json, options)!;
        Console.WriteLine(back.Items.Count + " " + back.Items[1].Name + " " + back.Secret);

        using var doc = JsonDocument.Parse("{\"a\":{\"b\":[1,2,3]}}");
        Console.WriteLine(doc.RootElement.GetProperty("a").GetProperty("b")[2].GetInt32());
    }
}
