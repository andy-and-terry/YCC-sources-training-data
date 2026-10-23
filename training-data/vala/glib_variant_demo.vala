void main() {
    // Basic typed values
    Variant num = new Variant.int32(42);
    Variant text = new Variant.string("hello");
    stdout.printf("%s -> %s\n", num.get_type_string(), num.print(false));
    stdout.printf("%s -> %s\n", text.get_type_string(), text.print(false));

    // Tuples via format strings
    Variant pair = new Variant("(si)", "age", 30);
    string key;
    int val;
    pair.get("(si)", out key, out val);
    stdout.printf("tuple: %s = %d\n", key, val);

    // Arrays of strings
    string[] fruits = { "apple", "pear", "plum" };
    Variant arr = new Variant.strv(fruits);
    stdout.printf("array type: %s, size: %d\n",
                  arr.get_type_string(), (int) arr.n_children());

    // Dictionary of string -> variant
    var builder = new VariantBuilder(new VariantType("a{sv}"));
    builder.add("{sv}", "name", new Variant.string("Ada"));
    builder.add("{sv}", "score", new Variant.int32(99));
    Variant dict = builder.end();

    Variant? score = dict.lookup_value("score", VariantType.INT32);
    if (score != null) {
        stdout.printf("score: %d\n", score.get_int32());
    }
    stdout.printf("dict: %s\n", dict.print(false));
}
