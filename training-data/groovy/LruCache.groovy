class LruCache extends LinkedHashMap {
    int capacity

    LruCache(int cap) {
        super(16, 0.75f, true)
        capacity = cap
    }

    protected boolean removeEldestEntry(Map.Entry eldest) {
        return size() > capacity
    }
}

def cache = new LruCache(2)
cache.put(1, "a")
cache.put(2, "b")
println cache.get(1)
cache.put(3, "c")
println cache.get(2)
