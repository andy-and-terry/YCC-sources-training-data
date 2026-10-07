class BloomFilter : Object {
    bool[] bits;
    int size;
    int[] seeds = { 7, 17, 29 };

    public BloomFilter(int size) {
        this.size = size;
        bits = new bool[size];
    }

    int hash(string value, int seed) {
        int h = seed;
        for (int i = 0; i < value.length; i++) {
            h = (h * 31 + value[i]) % size;
            if (h < 0) {
                h += size;
            }
        }
        return h;
    }

    public void insert(string value) {
        foreach (int seed in seeds) {
            bits[hash(value, seed)] = true;
        }
    }

    public bool might_contain(string value) {
        foreach (int seed in seeds) {
            if (!bits[hash(value, seed)]) {
                return false;
            }
        }
        return true;
    }
}

void main() {
    var filter = new BloomFilter(64);
    filter.insert("apple");
    filter.insert("banana");

    stdout.printf("%s\n", filter.might_contain("apple").to_string());
    stdout.printf("%s\n", filter.might_contain("banana").to_string());
    stdout.printf("%s\n", filter.might_contain("cherry").to_string());
}
