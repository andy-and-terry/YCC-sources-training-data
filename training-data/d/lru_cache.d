import std.stdio;

class LRUCache {
    private int capacity;
    private int[int] map;
    private int[] order;

    this(int capacity) {
        this.capacity = capacity;
    }

    private void touch(int key) {
        int[] newOrder;
        foreach (k; order) {
            if (k != key) newOrder ~= k;
        }
        newOrder ~= key;
        order = newOrder;
    }

    int get(int key) {
        if ((key in map) is null) return -1;
        touch(key);
        return map[key];
    }

    void put(int key, int value) {
        if ((key in map) !is null) {
            map[key] = value;
            touch(key);
            return;
        }
        if (order.length >= capacity) {
            auto oldest = order[0];
            order = order[1 .. $];
            map.remove(oldest);
        }
        map[key] = value;
        order ~= key;
    }
}

void main() {
    auto cache = new LRUCache(2);
    cache.put(1, 100);
    cache.put(2, 200);
    writeln(cache.get(1));
    cache.put(3, 300);
    writeln(cache.get(2));
    writeln(cache.get(3));
}
