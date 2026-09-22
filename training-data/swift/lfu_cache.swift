final class LFUCache {
    private var capacity: Int
    private var values: [Int: Int] = [:]
    private var frequencies: [Int: Int] = [:]
    private var order: [Int: [Int]] = [:]
    private var minFrequency = 0

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int? {
        guard let value = values[key] else { return nil }
        bump(key)
        return value
    }

    func put(_ key: Int, _ value: Int) {
        guard capacity > 0 else { return }
        if values[key] != nil {
            values[key] = value
            bump(key)
            return
        }
        if values.count >= capacity {
            evict()
        }
        values[key] = value
        frequencies[key] = 1
        order[1, default: []].append(key)
        minFrequency = 1
    }

    private func bump(_ key: Int) {
        let freq = frequencies[key]!
        frequencies[key] = freq + 1
        order[freq]?.removeAll { $0 == key }
        if order[freq]?.isEmpty == true && minFrequency == freq {
            minFrequency += 1
        }
        order[freq + 1, default: []].append(key)
    }

    private func evict() {
        guard var bucket = order[minFrequency], !bucket.isEmpty else { return }
        let victim = bucket.removeFirst()
        order[minFrequency] = bucket
        values.removeValue(forKey: victim)
        frequencies.removeValue(forKey: victim)
    }
}

let cache = LFUCache(2)
cache.put(1, 1)
cache.put(2, 2)
print(cache.get(1) ?? -1)
cache.put(3, 3)
print(cache.get(2) ?? -1)
print(cache.get(3) ?? -1)
cache.put(4, 4)
print(cache.get(1) ?? -1)
print(cache.get(3) ?? -1)
print(cache.get(4) ?? -1)
