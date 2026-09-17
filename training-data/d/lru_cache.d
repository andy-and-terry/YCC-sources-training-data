import std.stdio;
import std.algorithm : countUntil, remove, SwapStrategy;

class LruCache {
    private int capacity;
    private int[int] map;
    private int[] order;

    this(int capacity) {
        this.capacity = capacity;
    }

    bool get(int key, out int value) {
        if (auto v = key in map) {
            value = *v;
            auto idx = order.countUntil(key);
            order = order.remove!(SwapStrategy.stable)(idx);
            order ~= key;
            return true;
        }
        return false;
    }

    void put(int key, int value) {
        if (key in map) {
            auto idx = order.countUntil(key);
            order = order.remove!(SwapStrategy.stable)(idx);
        } else if (map.length >= capacity) {
            auto oldest = order[0];
            order = order[1 .. $];
            map.remove(oldest);
        }
        map[key] = value;
        order ~= key;
    }
}

void main() {
    auto cache = new LruCache(2);
    cache.put(1, 100);
    cache.put(2, 200);

    int value;
    cache.get(1, value);
    writeln(value);

    cache.put(3, 300);
    writeln(cache.get(2, value));

    cache.get(3, value);
    writeln(value);
}
