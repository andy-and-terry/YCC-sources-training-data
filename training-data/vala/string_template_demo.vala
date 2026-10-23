void main () {
    string name = "Vala";
    int version = 2;
    double ratio = 0.75;

    string greeting = @"Hello, $name!";
    print ("%s\n", greeting);

    print ("%s\n", @"Version $(version + 1) is next");
    print ("%s\n", @"Ratio: $(ratio * 100)%");
    print ("%s\n", @"Upper: $(name.up ())");

    string[] items = { "a", "b", "c" };
    print ("%s\n", @"Count: $(items.length), first: $(items[0])");
}
