import std.stdio;

struct BloomFilter {
    private bool[] bits;
    private size_t size;

    this(size_t size) {
        this.size = size;
        bits = new bool[size];
    }

    private size_t hash1(string s) {
        size_t h = 5381;
        foreach (c; s) h = (h * 33 + c) % size;
        return h;
    }

    private size_t hash2(string s) {
        size_t h = 0;
        foreach (c; s) h = (h * 31 + c) % size;
        return h;
    }

    void add(string s) {
        bits[hash1(s)] = true;
        bits[hash2(s)] = true;
    }

    bool mightContain(string s) {
        return bits[hash1(s)] && bits[hash2(s)];
    }
}

void main() {
    auto filter = BloomFilter(64);
    filter.add("apple");
    filter.add("banana");

    writeln(filter.mightContain("apple"));
    writeln(filter.mightContain("banana"));
    writeln(filter.mightContain("cherry"));
}
