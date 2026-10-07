class LfuCache<K, V>(private val capacity: Int) {
    private val values = mutableMapOf<K, V>()
    private val freqs = mutableMapOf<K, Int>()

    fun get(key: K): V? {
        if (key !in values) return null
        freqs[key] = (freqs[key] ?: 0) + 1
        return values[key]
    }

    fun put(key: K, value: V) {
        if (capacity == 0) return
        if (key in values) {
            values[key] = value
            freqs[key] = (freqs[key] ?: 0) + 1
            return
        }
        if (values.size >= capacity) {
            val leastUsed = freqs.minByOrNull { it.value }?.key
            if (leastUsed != null) {
                values.remove(leastUsed)
                freqs.remove(leastUsed)
            }
        }
        values[key] = value
        freqs[key] = 1
    }
}

fun main() {
    val cache = LfuCache<Int, Int>(2)
    cache.put(1, 1)
    cache.put(2, 2)
    println(cache.get(1))
    cache.put(3, 3) // evicts key 2, the least frequently used
    println(cache.get(2))
    println(cache.get(3))
}
