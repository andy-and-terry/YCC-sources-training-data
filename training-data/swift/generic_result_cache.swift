struct Cache<Key: Hashable, Value> {
    private var storage: [Key: Value] = [:]
    private(set) var hits = 0
    private(set) var misses = 0

    mutating func value(for key: Key, compute: () -> Value) -> Value {
        if let v = storage[key] {
            hits += 1
            return v
        }
        misses += 1
        let v = compute()
        storage[key] = v
        return v
    }
}

var cache = Cache<String, Int>()
print(cache.value(for: "abc") { "abc".count })
print(cache.value(for: "abc") { 999 })
print(cache.value(for: "hello") { "hello".count })
print("hits \(cache.hits), misses \(cache.misses)")
