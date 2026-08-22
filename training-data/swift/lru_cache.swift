final class LRUCache {
    private var capacity: Int
    private var order: [Int] = []
    private var store: [Int: Int] = [:]

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int? {
        guard let value = store[key] else { return nil }
        order.removeAll { $0 == key }
        order.append(key)
        return value
    }

    func put(_ key: Int, _ value: Int) {
        if store[key] != nil {
            order.removeAll { $0 == key }
        } else if store.count >= capacity {
            let oldest = order.removeFirst()
            store.removeValue(forKey: oldest)
        }
        store[key] = value
        order.append(key)
    }
}

let cache = LRUCache(2)
cache.put(1, 1)
cache.put(2, 2)
print(cache.get(1) ?? -1)
cache.put(3, 3)
print(cache.get(2) ?? -1)
