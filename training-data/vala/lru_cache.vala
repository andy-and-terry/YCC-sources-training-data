class LRUCache : Object {
    int capacity;
    Gee.HashMap<int, int> map;
    Gee.ArrayList<int> order;

    public LRUCache(int cap) {
        capacity = cap;
        map = new Gee.HashMap<int, int>();
        order = new Gee.ArrayList<int>();
    }

    public int get(int key) {
        if (map.has_key(key)) {
            order.remove(key);
            order.add(key);
            return map[key];
        }
        return -1;
    }

    public void put(int key, int value) {
        if (map.has_key(key)) order.remove(key);
        map[key] = value;
        order.add(key);
        if (order.size > capacity) {
            int evict = order[0];
            order.remove_at(0);
            map.unset(evict);
        }
    }
}

void main() {
    var cache = new LRUCache(2);
    cache.put(1, 1);
    cache.put(2, 2);
    stdout.printf("%d\n", cache.get(1));
    cache.put(3, 3);
    stdout.printf("%d\n", cache.get(2));
}
