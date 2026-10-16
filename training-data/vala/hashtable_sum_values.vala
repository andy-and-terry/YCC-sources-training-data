void main () {
    var stock = new HashTable<string, int> (str_hash, str_equal);
    stock.insert ("bolts", 120);
    stock.insert ("nuts", 80);
    stock.insert ("washers", 45);

    int total = 0;
    stock.foreach ((name, qty) => {
        total += qty;
    });
    stdout.printf ("total items: %d\n", total);

    stock.foreach_remove ((name, qty) => qty < 50);
    stdout.printf ("kept %u entries\n", stock.size ());
    stdout.printf ("has nuts: %s\n", stock.contains ("nuts").to_string ());
}
