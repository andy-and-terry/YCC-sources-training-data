import std.stdio;

class HashTable {
    private int[][] buckets;
    private string[][] keys;
    private size_t capacity;

    this(size_t capacity) {
        this.capacity = capacity;
        buckets = new int[][](capacity);
        keys = new string[][](capacity);
    }

    private size_t hash(string key) {
        size_t h = 0;
        foreach (c; key) h = h * 31 + c;
        return h % capacity;
    }

    void insert(string key, int value) {
        auto idx = hash(key);
        foreach (i, k; keys[idx]) {
            if (k == key) {
                buckets[idx][i] = value;
                return;
            }
        }
        keys[idx] ~= key;
        buckets[idx] ~= value;
    }

    int get(string key) {
        auto idx = hash(key);
        foreach (i, k; keys[idx]) {
            if (k == key) return buckets[idx][i];
        }
        return -1;
    }
}

void main() {
    auto table = new HashTable(16);
    table.insert("apple", 1);
    table.insert("banana", 2);
    table.insert("apple", 3);
    writeln(table.get("apple"));
    writeln(table.get("banana"));
    writeln(table.get("cherry"));
}
