class LruCache<K, V>(private val capacity: Int) {
    private val map = LinkedHashMap<K, V>(capacity, 0.75f, true)

    fun get(key: K): V? = map[key]

    fun put(key: K, value: V) {
        if (map.size >= capacity && !map.containsKey(key)) {
            val oldest = map.keys.first()
            map.remove(oldest)
        }
        map[key] = value
    }
}

fun main() {
    val cache = LruCache<Int, Int>(2)
    cache.put(1, 1)
    cache.put(2, 2)
    println(cache.get(1))
    cache.put(3, 3)
    println(cache.get(2))
}
