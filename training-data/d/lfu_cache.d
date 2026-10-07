import std.stdio;
import std.algorithm;

class LfuCache {
    private int capacity;
    private int[int] values;
    private int[int] freq;

    this(int capacity) {
        this.capacity = capacity;
    }

    bool get(int key, out int value) {
        if (key !in values) return false;
        freq[key]++;
        value = values[key];
        return true;
    }

    void put(int key, int value) {
        if (capacity == 0) return;

        if (key in values) {
            values[key] = value;
            freq[key]++;
            return;
        }

        if (values.length >= capacity) {
            int evictKey;
            int minFreq = int.max;
            foreach (k, f; freq) {
                if (f < minFreq) {
                    minFreq = f;
                    evictKey = k;
                }
            }
            values.remove(evictKey);
            freq.remove(evictKey);
        }

        values[key] = value;
        freq[key] = 1;
    }
}

void main() {
    auto cache = new LfuCache(2);
    cache.put(1, 10);
    cache.put(2, 20);
    int v;
    cache.get(1, v);
    cache.put(3, 30);
    writeln(cache.get(2, v));
    cache.get(1, v);
    writeln(v);
}
