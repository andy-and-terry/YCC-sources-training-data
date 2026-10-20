public class JsonSerializeDeserialize {
    public class Item {
        public String sku;
        public Integer qty;
        public List<String> tags;
        public Item(String s, Integer q) { sku = s; qty = q; tags = new List<String>(); }
    }

    public static String toJson() {
        Item i = new Item('A-1', 3);
        i.tags.add('new');
        return JSON.serialize(i);
    }

    public static Item fromJson(String body) {
        return (Item) JSON.deserialize(body, Item.class);
    }

    public static Object untyped(String body) {
        Map<String, Object> m = (Map<String, Object>) JSON.deserializeUntyped(body);
        List<Object> arr = (List<Object>) m.get('items');
        return arr == null ? null : arr[0];
    }

    public static String pretty(Object o) { return JSON.serializePretty(o); }
}
