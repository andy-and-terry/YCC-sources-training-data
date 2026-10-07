class LFUCache : Object {
    HashTable<int, int> values;
    HashTable<int, int> freqs;
    int capacity;
    int min_freq = 0;

    public LFUCache(int capacity) {
        this.capacity = capacity;
        values = new HashTable<int, int>(direct_hash, direct_equal);
        freqs = new HashTable<int, int>(direct_hash, direct_equal);
    }

    void touch(int key) {
        int f = freqs.get(key);
        freqs.set(key, f + 1);
    }

    public int get(int key) {
        if (!values.contains(key)) {
            return -1;
        }
        touch(key);
        return values.get(key);
    }

    public void put(int key, int value) {
        if (capacity <= 0) {
            return;
        }
        if (values.contains(key)) {
            values.set(key, value);
            touch(key);
            return;
        }
        if (values.size() >= capacity) {
            int evict_key = -1;
            int evict_freq = int.MAX;
            values.foreach((k, v) => {
                int f = freqs.get(k);
                if (f < evict_freq) {
                    evict_freq = f;
                    evict_key = k;
                }
            });
            values.remove(evict_key);
            freqs.remove(evict_key);
        }
        values.set(key, value);
        freqs.set(key, 0);
    }
}

void main() {
    var cache = new LFUCache(2);
    cache.put(1, 10);
    cache.put(2, 20);
    stdout.printf("%d\n", cache.get(1));
    cache.put(3, 30);
    stdout.printf("%d\n", cache.get(2));
    stdout.printf("%d\n", cache.get(3));
}
